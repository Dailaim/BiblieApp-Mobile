import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/core/contexts/theme_context.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:niku/niku.dart';
import 'package:niku/namespace.dart' as n;

final myAutoDisposeProvider = StateProvider((ref) => 0);

extension ApplyToN on Niku {
  void _add(Widget Function(Widget) builder) => $parent.add(builder);
  void get container => _add((w) => Container(
        child: w,
      ));
}

class FavoritesScreen extends HookConsumerWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState<int>(0);

    final countP = ref.watch(myAutoDisposeProvider);
    final themeApp = ref.watch(colorThemeProvider);

    return n.Column(
      [
        Text("Count: ${count.value}"),
        OutlinedButton(
          onPressed: () => count.value++,
          child: const Text('Increment'),
        ),
        n.Column(
          [
            "Count: ${countP}".n,
            OutlinedButton(
              onPressed: () =>
                  ref.watch(myAutoDisposeProvider.notifier).state++,
              child: 'Increment'.n,
            ),
            OutlinedButton(
              onPressed: () => {
                ref
                    .read(colorThemeProvider.notifier)
                    .toggleTheme(themeApp + 1 < 9 ? themeApp + 1 : 0)
              },
              child: 'setTheme'.n,
            ),
            OutlinedButton(
              onPressed: () =>
                  {ref.read(darkThemeProvider.notifier).toggleDark()},
              child: 'setDark'.n,
            ),
          ],
        ),
      ],
    )
      ..mainAxisAlignment = MainAxisAlignment.center
      ..center
      ..padding = const EdgeInsets.all(16.0)
      ..useParent((w) => w..container);
  }
}
