import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/core/contexts/theme_context.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myAutoDisposeProvider = StateProvider((ref) => 0);

class FavoritesScreen extends HookConsumerWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState<int>(0);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Count: ${count.value}"),
              OutlinedButton(
                onPressed: () => count.value++,
                child: const Text('Increment'),
              ),
              HookConsumer(builder: (context, ref, child) {
                final countP = ref.watch(myAutoDisposeProvider);
                final themeApp = ref.watch(ThemeProvider).selectedTheme;
                final isDark = ref.watch(ThemeProvider).isDark;
                return Column(
                  children: [
                    Text("Count: ${countP}"),
                    OutlinedButton(
                      onPressed: () =>
                          ref.watch(myAutoDisposeProvider.notifier).state++,
                      child: const Text('Increment'),
                    ),
                    OutlinedButton(
                      onPressed: () => {
                        ref
                            .read(ThemeProvider.notifier)
                            .setTheme(themeApp == 0 ? 3 : 0)
                      },
                      child: const Text('setTheme'),
                    ),
                    OutlinedButton(
                      onPressed: () =>
                          {ref.read(ThemeProvider.notifier).setDark(!isDark)},
                      child: const Text('setDark'),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
