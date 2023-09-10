import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutterpractic/modules/favorites/views/favorite_screen.dart';
import 'package:flutterpractic/modules/home/views/book_screen.dart';
import 'package:flutterpractic/modules/home/views/home_screen.dart';
import 'package:flutterpractic/modules/home/widgets/float_button.dart';
import 'package:flutterpractic/modules/profile/views/profile_screen.dart';
import 'package:flutterpractic/modules/search/views/search_screen.dart';
import 'package:flutterpractic/shared/widgets/nav_bar.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    ShellRoute(
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              body: child,
              floatingActionButton: const FloatButtonHome(),
              floatingActionButtonLocation: ExpandableFab.location,
            );
          },
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: HomeScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'book/:id',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      key: state.pageKey,
                      name: state.name,
                      child: BookScreen(
                        name: state.pathParameters['id']!,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/favorites',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              name: state.name,
              child: FavoritesScreen(),
            );
          },
        ),
        GoRoute(
          path: '/search',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              name: state.name,
              child: SearchScreen(),
            );
          },
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              name: state.name,
              child: ProfileScreen(),
            );
          },
        ),
      ],
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: NavBar(router: router),
        );
      },
    ),
  ],
);
