import 'package:flutter/material.dart';
import 'package:flutterpractic/core/contexts/auth_context.dart';
import 'package:flutterpractic/core/router/auth_router.dart';
import 'package:flutterpractic/core/router/home/router.dart';
import 'package:flutterpractic/modules/favorites/views/favorite_screen.dart';
import 'package:flutterpractic/modules/search/views/search_screen.dart';
import 'package:flutterpractic/shared/widgets/nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authRouter = ref.watch(authRouterProvider);
  final homeRoutes = ref.watch(homeRoutesProvider);

  return GoRouter(
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) => Scaffold(
          body: child,
          bottomNavigationBar: const NavBar(),
        ),
        routes: [
          homeRoutes,
          GoRoute(
            path: '/favorites',
            redirect: (_, state) {
              final auth = ref.watch(authProvider);
              return auth.token != null ? null : '/auth/login';
            },
            builder: (context, state) => FavoritesScreen(),
          ),
          GoRoute(
            path: '/search',
            builder: (context, state) => SearchScreen(),
          ),
          GoRoute(
            path: '/profile',
            redirect: (_, state) {
              final auth = ref.watch(authProvider);

              return auth.token != null ? null : '/auth/login';
            },
            builder: (context, state) => const SizedBox(),
          ),
          authRouter
        ],
      ),
    ],
  );
}
