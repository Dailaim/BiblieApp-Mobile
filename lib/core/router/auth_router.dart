import 'package:flutter/material.dart';
import 'package:flutterpractic/modules/auth/views/login_screen.dart';
import 'package:flutterpractic/modules/auth/views/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

ShellRoute authRouter(ProviderRef<GoRouter> ref) {
  return ShellRoute(
    builder: (context, state, child) {
      return HookConsumer(
        builder: (context, ref, _) {
          return child;
        },
      );
    },
    routes: [
      GoRoute(
        path: "/auth",
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: const SizedBox(),
          );
        },
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
