import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/modules/home/context/book_context.dart';
import 'package:flutterpractic/modules/home/context/save_chapters_context.dart';
import 'package:flutterpractic/modules/home/widgets/float_button_arrows.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:niku/niku.dart';
import 'package:niku/namespace.dart' as n;

class ChapterScreen extends HookConsumerWidget {
  const ChapterScreen({Key? key}) : super(key: key); // Corregido el constructor

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chaptersContext = ref.watch(saveChaptersProvider);

    final version = ref.watch(bibleVersionProvider);
    final bookName = ref.watch(bibleBookProvider)?.name;
    final chapterNumber = ref.watch(bibleChapterProvider);

    final scrollController = useScrollController();

    useEffect(() {
      if (bookName != null && chapterNumber != null) {
        ref.read(saveChaptersProvider.notifier).saveToLink(
              version: version.url,
              book: bookName,
              chapter: chapterNumber,
            );
      }
      return null;
    }, [version, bookName, chapterNumber]);

    if (bookName == null || chapterNumber == null) {
      return Scaffold(body: "Faltan datos.".n..center);
    }

    final verses = chaptersContext[version.url]
        ?.booksMaps[bookName]
        ?.chaptersMap[chapterNumber]
        ?.verses
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: n.Row(
          [
            'Capitulo: $chapterNumber'.n,
            const Spacer(),
            bookName.n,
          ],
        ),
      ),
      body: n.Stack(
        [
          verses == null
              ? (const CircularProgressIndicator().niku..center)
              : SingleChildScrollView(
                  controller: scrollController,
                  child: n.Column(
                    [
                      n.RichText(
                        n.TextSpan(null)
                          ..children = [
                            ...verses
                                .map((verse) => n.TextSpan(null)
                                  ..children = [
                                    n.TextSpan('${verse.number} ')
                                      ..fontWeight = FontWeight.bold
                                      ..fontSize = 16.0,
                                    if (verse.study != null)
                                      n.TextSpan('${verse.study}\n')
                                        ..fontStyle = FontStyle.italic
                                        ..color = Colors.grey,
                                    n.TextSpan("${verse.verse} "),
                                  ])
                                .toList(),
                          ]
                          ..fontSize = 18.0
                          ..color = Colors.black,
                      ).niku
                        ..padding = const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                    ],
                  )..crossAxisAlignment = CrossAxisAlignment.start,
                ),

          // Botón de "Anterior"
          FloatButtonArrow(
            scrollController: scrollController,
          ).niku
            ..left = 16.0
            ..bottom = 16.0,
        ],
      )..fit = StackFit.expand,
    );
  }
}


//  ListView.builder(
//                   controller: scrollController,
//                   itemCount: verses.length + 4,
//                   itemBuilder: (context, index) {
//                     if (index < verses.length) {
//                       final verse = (verses
//                         ..sort((a, b) => a.number.compareTo(b.number)))[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 1.0, horizontal: 16.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(verse.number.toString(),
//                                 style: const TextStyle(fontSize: 16.0)),
//                             const SizedBox(width: 16.0),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   if (verse.study != null)
//                                     Text(verse.study!,
//                                         style: const TextStyle(fontSize: 16.0)),
//                                   Text(verse.verse,
//                                       style: const TextStyle(fontSize: 20.0)),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     } else {
//                       return const SizedBox(height: 50.0);
//                     }
//                   },
//                 ),