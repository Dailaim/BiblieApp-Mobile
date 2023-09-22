import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/modules/home/context/book_context.dart';
import 'package:flutterpractic/modules/home/context/bible_chapters_map_context.dart';
import 'package:flutterpractic/modules/home/widgets/float_button_arrows.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChapterScreen extends HookConsumerWidget {
  const ChapterScreen({Key? key}) : super(key: key); // Corregido el constructor

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bibleContext = ref.watch(bibleProvider);
    final chaptersContext = ref.watch(saveChaptersProvider);

    final version = bibleContext.version;
    final bookName = bibleContext.book?.name;
    final chapterNumber = bibleContext.chapter;

    final scrollController = useScrollController();

    useEffect(() {
      if (version != null && bookName != null && chapterNumber != null) {
        ref.read(saveChaptersProvider.notifier).saveToLink(
              version: version.url,
              book: bookName,
              chapter: chapterNumber,
            );
      }
      return null;
    }, [version, bookName, chapterNumber]);

    if (version == null || bookName == null || chapterNumber == null) {
      return const Scaffold(body: Center(child: Text('Faltan datos.')));
    }

    final verses = chaptersContext[version.url]
        ?.booksMaps[bookName]
        ?.chaptersMap[chapterNumber]
        ?.verses
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Capitulo: $chapterNumber'),
            const Spacer(),
            Text(bookName),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Lista de versos
          verses == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  controller: scrollController,
                  itemCount: verses.length + 4,
                  itemBuilder: (context, index) {
                    if (index < verses.length) {
                      final verse = (verses
                        ..sort((a, b) => a.number.compareTo(b.number)))[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(verse.number.toString(),
                                style: const TextStyle(fontSize: 16.0)),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (verse.study != null)
                                    Text(verse.study!,
                                        style: const TextStyle(fontSize: 16.0)),
                                  Text(verse.verse,
                                      style: const TextStyle(fontSize: 20.0)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox(height: 50.0);
                    }
                  },
                ),
          // Botón de "Anterior"

          Positioned(
            bottom: 10.0,
            left: 16.0,
            child: FloatButtonArrow(
              scrollController: scrollController,
            ),
          )
        ],
      ),
    );
  }
}
