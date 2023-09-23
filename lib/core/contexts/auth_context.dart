import 'package:dio/dio.dart';
import 'package:flutterpractic/core/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_context.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  User build() {
    return User();
  }

  void setToken(String token) {
    state = state.copyWith(token: token);
  }

  void setUser({String? email, String? user, String? token, String? password}) {
    state = state.copyWith(
      email: email,
      user: user,
      token: token,
      password: password,
    );
  }

  void logout() {
    state = User();
  }
}

@riverpod
Future<Response<dynamic>> authLogin(
  AuthLoginRef ref, {
  required String email,
  required String password,
}) async {
  final dio = Dio();
  return dio.post(
    "https://bible-api.deno.dev/auth/login",
    data: {
      "email": email,
      "password": password,
    },
  );
}

@riverpod
Future<Response<dynamic>> authRegister(
  AuthRegisterRef ref, {
  required String email,
  required String username,
  required String password,
}) async {
  final dio = Dio();

  final response =
      await dio.post("https://bible-api.deno.dev/auth/signup", data: {
    "email": email,
    "user": username,
    "password": password,
  });

  final token = response.data?["token"];

  return token;
}
