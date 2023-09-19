import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutterpractic/core/contexts/authContext.dart';
import 'package:flutterpractic/core/contexts/router_key.dart';
import 'package:flutterpractic/core/router/auth_router.dart';
import 'package:flutterpractic/modules/favorites/views/favorite_screen.dart';
import 'package:flutterpractic/modules/home/views/book_chapter.dart';
import 'package:flutterpractic/modules/home/views/book_screen.dart';
import 'package:flutterpractic/modules/home/views/home_screen.dart';
import 'package:flutterpractic/modules/home/widgets/float_button_menu.dart';
import 'package:flutterpractic/modules/search/views/search_screen.dart';
import 'package:flutterpractic/shared/widgets/nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      ShellRoute(
        routes: [
          ShellRoute(
            builder: (context, state, child) {
              return Scaffold(
                body: Consumer(
                  builder: (context, ref, _) {
                    Future.microtask(() {
                      ref.read(routerKeyProvider.notifier).state = 0;
                    });
                    return child;
                  },
                ),
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
                    child: const HomeScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'book',
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        key: state.pageKey,
                        name: state.name,
                        child: const BookScreen(),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'chapter',
                        pageBuilder: (context, state) {
                          return NoTransitionPage(
                            key: state.pageKey,
                            name: state.name,
                            child: const ChapterScreen(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/favorites',
            redirect: (_, state) {
              final auth = ref.watch(authProvider);
              return auth.token != null ? '/favorites' : '/auth/login';
            },
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
            redirect: (_, state) {
              final auth = ref.watch(authProvider);

              return auth.token != null ? "/profile" : '/auth/login';
            },
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const SizedBox(),
              );
            },
          ),
          authRouter(ref),
        ],
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: const NavBar(),
          );
        },
      ),
    ],
  );
});
