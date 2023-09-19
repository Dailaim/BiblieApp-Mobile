import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractic/core/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthContext extends StateNotifier<User> {
  AuthContext() : super(User());

  void clearUser() {
    state = User();
  }

  void saveToken(String token) {
    state = state.copyWith(token: token);
  }

  void saveEmail(String email) {
    state = state.copyWith(email: email);
  }

  void saveUsername(String username) {
    state = state.copyWith(user: username);
  }

  void savePassword(String password) {
    state = state.copyWith(password: password);
  }

  void saveUser({
    String? email,
    String? username,
    String? token,
    String? password,
  }) {
    state = state.copyWith(
      email: email,
      user: username,
      token: token,
      password: password,
    );
  }

  void login({
    required String email,
    required String password,
    ValueNotifier<String?>? notifier,
  }) async {
    final dio = Dio();

    try {
      final response =
          await dio.post("https://bible-api.deno.dev/auth/login", data: {
        "email": state.email ?? email,
        "password": state.password ?? password,
      });

      final token = response.data?["token"];

      saveToken(token);
    } catch (e) {
      print(e);
      notifier?.value = 'Invalid username or password. Please try again.';
      return null;
    }
  }

  void register({
    required String email,
    required String username,
    required String password,
    ValueNotifier<String?>? notifier,
  }) async {
    final dio = Dio();

    try {
      final response =
          await dio.post("https://bible-api.deno.dev/auth/signup", data: {
        "email": email,
        "user": username,
        "password": password,
      });

      final token = response.data?["token"];

      saveToken(token);
    } catch (e) {
      notifier?.value = 'Invalid username or password. Please try again.';
      return null;
    }
  }
}

final authProvider = StateNotifierProvider<AuthContext, User>((ref) {
  return AuthContext();
});
