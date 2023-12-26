import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/core/enums/books.dart';
import 'package:flutterpractic/core/services/shared_preferences_service.dart';
import 'package:flutterpractic/core/utils/dynamic_columns.dart';
import 'package:flutterpractic/core/utils/get_theme.dart';
import 'package:flutterpractic/modules/home/context/book_context.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:niku/niku.dart';
import 'package:niku/namespace.dart' as n;

extension ApplyToUseParent on Niku {
  void _add(Widget Function(Widget) builder) => $parent.add(builder);
  void get card => _add((w) => Card(
        child: w,
      ));
}

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(bibleVersionProvider);

    final columns = useDynamicColumns(200);

    useEffect(() {
      Future.microtask(() async {
        final savedData = await SharedPreferencesService.getData('init');
        if (savedData == null) {
          _alertWelcome(context);
          await SharedPreferencesService.saveData('init', jsonEncode(true));
        }
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Text(version.short ?? version.name),
          const Spacer(),
          "Biblia App".n,
        ],
      )),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns, // Número de columnas
          childAspectRatio: 3 / 2, // Esto controla la proporción del ítem
          crossAxisSpacing: 10, // Espacio horizontal entre elementos
          mainAxisSpacing: 10, // Espacio vertical entre elementos
        ),
        itemCount: bibleBooks.length,
        itemBuilder: (context, index) {
          final book = bibleBooks[index];
          return InkWell(
            onTap: () {
              ref.read(bibleBookProvider.notifier).changeBook(book);

              context.go("/book");
            },
            child: n.Column([
              book.name.n..textAlign = TextAlign.center,
              n.Box()..h = 8,
              "${book.chapters} capítulos".n..textAlign = TextAlign.center,
            ])
              ..mainAxisAlignment = MainAxisAlignment.center,
          ).niku
            ..card;
        },
      ).niku
        ..padding = const EdgeInsets.all(8.0)
        ..center,
    );
  }

  Widget _alertText(ColorScheme theme) {
    return n.Column([
      n.RichText(
        n.TextSpan('La app para ')
          ..children = [
            n.TextSpan(
              'Estudiar',
            )..color = theme.surfaceTint,
            n.TextSpan(' y '),
            n.TextSpan('Leer')..color = theme.surfaceTint,
            n.TextSpan(' la Biblia que esperabas.'),
          ]
          ..fontSize = 20
          ..color = theme.onSurface,
      ),
    ])
      ..mainAxisSize = MainAxisSize.min;
  }

  Future<void> _alertWelcome(BuildContext context) {
    return n.showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        final theme = getTheme(context);
        return n.Alert()
          ..title = 'Bienvenido a biblia app'.n
          ..content = _alertText(theme)
          ..actionsAlignment = MainAxisAlignment.center
          ..actions = [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: 'estudiar la Biblia'.n..fontSize = 20,
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              child: 'Preguntas frecuentes'.n
                ..fontSize = 20
                ..color = theme.secondary,
            ).niku
          ];
      },
    );
  }
}
