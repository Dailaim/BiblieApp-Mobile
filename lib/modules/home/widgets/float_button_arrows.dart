import 'package:flutter/material.dart';
import 'package:flutterpractic/modules/home/context/book_context.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatButtonArrow extends HookConsumerWidget {
  final ScrollController scrollController;
  const FloatButtonArrow({super.key, required this.scrollController});

  @override
  build(BuildContext context, WidgetRef ref) {
    final chapter = ref.watch(bibleChapterProvider)!;
    final book = ref.watch(bibleBookProvider)!;

    return Column(
      children: [
        if (chapter == 1)
          const SizedBox.shrink()
        else
          FloatingActionButton(
            heroTag: 'back',
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              ref.read(bibleChapterProvider.notifier).changeChapter(
                    chapter - 1 < 1 ? 1 : chapter - 1,
                  );

              scrollControllerAnimated(scrollController);
            },
          ),
        const SizedBox(height: 8.0),
        if (chapter + 1 > book.chapters)
          const SizedBox.shrink()
        else
          FloatingActionButton(
            heroTag: 'forward',
            child: const Icon(Icons.arrow_forward),
            onPressed: () {
              ref.read(bibleChapterProvider.notifier).changeChapter(
                    chapter + 1 > book.chapters ? book.chapters : chapter + 1,
                  );

              scrollControllerAnimated(scrollController);
            },
          ),
      ],
    );
  }

  void scrollControllerAnimated(ScrollController scrollController) {
    if (!scrollController.hasClients) {
      return;
    }

    if (scrollController.offset == 0.0) {
      return;
    }

    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
