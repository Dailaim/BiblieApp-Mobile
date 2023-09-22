import 'package:flutter/material.dart';
import 'package:flutterpractic/modules/home/context/book_context.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatButtonArrow extends HookConsumerWidget {
  final ScrollController scrollController;
  const FloatButtonArrow({super.key, required this.scrollController});

  @override
  build(BuildContext context, WidgetRef ref) {
    final bibleContext = ref.watch(bibleProvider);

    final chapterNumber = bibleContext.chapter!;

    return Column(
      children: [
        if (chapterNumber == 1)
          const SizedBox.shrink()
        else
          FloatingActionButton(
            heroTag: 'back',
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              ref.read(bibleProvider.notifier).state =
                  ref.read(bibleProvider.notifier).state.copyWith(
                        chapter: chapterNumber - 1 < 1 ? 1 : chapterNumber - 1,
                      );

              scrollControllerAnimated(scrollController);
            },
          ),
        const SizedBox(height: 8.0),
        if (chapterNumber + 1 > bibleContext.book!.chapters)
          const SizedBox.shrink()
        else
          FloatingActionButton(
            heroTag: 'forward',
            child: const Icon(Icons.arrow_forward),
            onPressed: () {
              ref.read(bibleProvider.notifier).state =
                  ref.read(bibleProvider.notifier).state.copyWith(
                        chapter: chapterNumber + 1 > bibleContext.book!.chapters
                            ? bibleContext.book!.chapters
                            : chapterNumber + 1,
                      );

              scrollControllerAnimated(scrollController);

              // Aquí debes añadir la lógica para ir al próximo capítulo.
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
