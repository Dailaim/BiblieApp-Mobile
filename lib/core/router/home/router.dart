import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutterpractic/core/contexts/router_key.dart';
import 'package:flutterpractic/modules/home/views/book_chapter.dart';
import 'package:flutterpractic/modules/home/views/book_screen.dart';
import 'package:flutterpractic/modules/home/views/home_screen.dart';
import 'package:flutterpractic/modules/home/widgets/float_button_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
ShellRoute homeRoutes(HomeRoutesRef ref) {
  return ShellRoute(
    builder: (context, state, child) {
      return Scaffold(
        body: SetKeyNavigator(
          index: 0,
          child: child,
        ),
        floatingActionButton: const FloatButtonHome(),
        floatingActionButtonLocation: ExpandableFab.location,
      );
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'book',
            builder: (context, state) => const BookScreen(),
            routes: [
              GoRoute(
                path: 'chapter',
                builder: (context, state) => const ChapterScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class SetKeyNavigator extends HookConsumerWidget {
  final Widget child;
  final int index;

  const SetKeyNavigator({
    Key? key,
    required this.child,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() {
      ref.watch(routerKeyProvider.notifier).state = index;
    });
    return child;
  }
}
