import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterpractic/core/utils/dynamic_columns.dart';
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

class BookScreen extends HookConsumerWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(bibleVersionProvider);
    final book = ref.watch(bibleBookProvider);
    final columns = useDynamicColumns(120);

    return Scaffold(
      appBar: AppBar(
        title: n.Row(
          [
            book!.name.n,
            const Spacer(),
            Text(version.short ?? version.name),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
        ),
        itemCount: book.chapters + 15,
        itemBuilder: (context, index) {
          if (index >= book.chapters) {
            return const SizedBox.shrink();
          }
          return InkWell(
            onTap: () {
              ref.read(bibleChapterProvider.notifier).changeChapter(index + 1);
              context.go('/book/chapter');
            },
            child: Center(
              child: (index + 1).toString().n..fontSize = 16,
            ),
          ).niku
            ..card
            ..padding = const EdgeInsets.all(2.0);
        },
      ).niku
        ..padding = const EdgeInsets.all(8.0),
    );
  }
}
