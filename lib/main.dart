import 'package:flutter/material.dart';
import 'package:flutterpractic/core/router/router.dart';
import './core/contexts/theme_context.dart';
import './core/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(colorThemeProvider);
    final dark = ref.watch(darkThemeProvider);
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme(
        selectedTheme: theme,
        isDark: dark,
      ).themeData,
    );
  }
}
