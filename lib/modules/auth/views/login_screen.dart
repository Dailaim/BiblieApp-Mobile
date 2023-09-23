import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/core/contexts/auth_context.dart';
import 'package:flutterpractic/core/router/router.dart';
import 'package:flutterpractic/modules/auth/validators/email.dart';
import 'package:flutterpractic/modules/auth/validators/password.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Form(
                key: formKey.value,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: usernameController,
                      validator: emailValidator,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: passwordValidator,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (!formKey.value.currentState!.validate()) return;

                        _dialogBuilder(
                          context,
                          email: usernameController.text,
                          password: passwordController.text,
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      context.go('/auth/register');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(
    BuildContext context, {
    required String email,
    required String password,
  }) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            padding: EdgeInsets.all(16),
            child: HookConsumer(builder: (context, ref, child) {
              final login = ref.watch(AuthLoginProvider(
                email: email,
                password: password,
              ));

              return login.when(
                data: (data) {
                  /* // Si la autenticación es exitosa, muestra un mensaje y cierra el diálogo.
                  Navigator.of(context).pop(); */
                  return SuccessWidget(
                    message: "¡Bienvenido!",
                    onOk: () {
                      ref.read(authProvider.notifier).setUser(
                            email: email,
                            password: password,
                            token: data.data["token"],
                          );
                      ref.read(goRouterProvider).pop();
                    },
                  );
                },
                error: (error, stack) {
                  // Si hay un error, muestra el mensaje de error.
                  return ErrorWidget(
                    errorMessage:
                        (error as DioException).response?.data['message'] ??
                            error.toString(),
                  );
                },
                loading: () => LoadingWidget(),
              );
            }),
          ),
        );
      },
    );
  }
}

class SuccessWidget extends StatelessWidget {
  final String message;
  final void Function()? onOk;

  const SuccessWidget({Key? key, required this.message, this.onOk})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 48,
        ),
        SizedBox(height: 16),
        Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            onOk?.call();
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 16),
        Text(
          "Iniciando sesión...",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorWidget({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
          size: 48,
        ),
        SizedBox(height: 16),
        Text(
          errorMessage,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cerrar'),
        ),
      ],
    );
  }
}
