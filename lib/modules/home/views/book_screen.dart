import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterpractic/core/utils/dynamic_columns.dart';
import 'package:flutterpractic/modules/home/context/book_context.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookScreen extends HookConsumerWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bibleContext = ref.watch(bibleProvider);
    final columns = useDynamicColumns(120);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(bibleContext.book!.name),
            const Spacer(),
            Text(bibleContext.version!.short ?? bibleContext.version!.name),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          itemCount: bibleContext.book!.chapters + 15,
          itemBuilder: (context, index) {
            if (index >= bibleContext.book!.chapters) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                child: InkWell(
                  onTap: () {
                    ref.read(bibleProvider.notifier).state =
                        ref.read(bibleProvider.notifier).state.copyWith(
                              chapter: index + 1,
                            );
                    context.go('/book/chapter');
                  },
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
