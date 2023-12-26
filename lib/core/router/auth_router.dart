import 'package:flutter/material.dart';
import 'package:flutterpractic/modules/auth/views/login_screen.dart';
import 'package:flutterpractic/modules/auth/views/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_router.g.dart';

@riverpod
ShellRoute authRouter(AuthRouterRef ref) {
  return ShellRoute(
    builder: (_, _0, child) => child,
    routes: [
      GoRoute(
        path: "/auth",
        builder: (context, state) => const SizedBox(),
        routes: [
          GoRoute(
            path: 'login',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const LoginScreen(),
              );
            },
          ),
          GoRoute(
            path: 'register',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const RegisterScreen(),
              );
            },
          ),
        ],
      )
    ],
  );
}
