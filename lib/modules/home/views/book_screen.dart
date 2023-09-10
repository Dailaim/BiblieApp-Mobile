import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/modules/home/context/select_book_context.dart';
import 'package:flutterpractic/modules/home/services/book_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookScreen extends HookConsumerWidget {
  final String name;

  const BookScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(selectBookContext);

    final book = useState<Book?>(null);

    useEffect(() {
      Future.microtask(() async {
        book.value = await bookService(
            "https://bible-api.deno.dev/api/${version.url}/book/${name}/1");
      });
      return null;
    }, [version]);

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: book.value == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: book.value!.vers.length + 4,
              itemBuilder: (context, index) {
                if (index < book.value!.vers.length) {
                  final verse = book.value!.vers[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Añadido aquí
                      children: [
                        Text(
                          verse.number.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (verse.study != null)
                                Text(
                                  verse.study!,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              Text(
                                verse.verse,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox(
                    height: 50.0,
                  );
                }
              },
            ),
    );
  }
}
