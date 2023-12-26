import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractic/shared/constants/url_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<dynamic> loginUser({
  required String email,
  required String password,
  ValueNotifier<String?>? notifier,
}) async {
  final dio = Dio();

  try {
    final response = await dio.post("$urlApi/auth/login", data: {
      "email": email,
      "password": password,
    });

    print(response);

    return response;
  } catch (e) {
    print(e);
    notifier?.value = 'Invalid username or password. Please try again.';
    return null;
  }
}
