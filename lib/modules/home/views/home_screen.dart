import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/core/enums/books.dart';
import 'package:flutterpractic/core/utils/get_theme.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int desiredItemWidth = 250;

    final width = useState<double>(MediaQuery.of(context).size.width);

    final columns = useState<int>((width.value / 200).floor());

    useEffect(() {
      Future.microtask(() => _dialogBuilder(context));
      return null;
    }, []);

    useEffect(() {
      Future.microtask(() {
        width.value = MediaQuery.of(context).size.width;
        columns.value = (width.value / desiredItemWidth).floor();
      });
      return null;
    }, [width.value, MediaQuery.of(context).size.width]);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns.value, // Número de columnas
            childAspectRatio: 3 / 2, // Esto controla la proporción del ítem
            crossAxisSpacing: 10, // Espacio horizontal entre elementos
            mainAxisSpacing: 10, // Espacio vertical entre elementos
          ),
          itemCount: bibleBooks.length,
          itemBuilder: (context, index) {
            final book = bibleBooks[index];
            return Card(
              child: InkWell(
                onTap: () {
                  context.go("/book/${book.name}");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      book.name,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${book.chapters} capítulos",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Método para el texto personalizado en fila
  Widget _customizedRow(ColorScheme theme) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: 'La app para '),
          TextSpan(
            text: 'Estudiar',
            style: TextStyle(color: theme.surfaceTint),
          ),
          const TextSpan(text: ' y '),
          const TextSpan(text: 'Leer', style: TextStyle(color: Colors.teal)),
          const TextSpan(text: ' la Biblia que esperabas.'),
        ],
        style: TextStyle(
          fontSize: 20,
          color: theme.onSurface,
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final theme = getTheme(context);
        return AlertDialog(
          title: const Text('Bienvenido a biblia app'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _customizedRow(theme),
              const SizedBox(height: 20),
            ],
          ),
          actions: <Widget>[
            Center(
                child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'estudiar la Biblia',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.secondaryContainer,
                  ),
                  child: Text(
                    'Preguntas frecuentes',
                    style: TextStyle(fontSize: 20, color: theme.secondary),
                  ),
                ),
              ],
            )),
          ],
        );
      },
    );
  }
}
