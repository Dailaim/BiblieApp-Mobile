import 'dart:io';

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
              final router = ref.watch(goRouterProvider);

              return login.when(
                data: (data) {
                  /* // Si la autenticación es exitosa, muestra un mensaje y cierra el diálogo.
                  Navigator.of(context).pop(); */
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Bienvenido ${data ?? "Fatal error"}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (data != null && data.isNotEmpty) {
                            ref.read(authProvider.notifier).setToken(data);
                            router.pop();
                          }
                          print("fagsdddddddddddddfdas");
                          print("token: ${ref.read(authProvider).token}");

                          Navigator.of(context).pop();
                        },
                        child: Text('Ir a Home'),
                      ),
                    ],
                  );
                },
                error: (error, stack) {
                  // Si hay un error, muestra el mensaje de error.
                  return Text(
                    "Error: ${error.toString()}",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  );
                },
                loading: () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(), // Cambio del símbolo de carga
                    SizedBox(height: 16),
                    Text(
                      "Iniciando sesión...",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
