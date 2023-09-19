import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/core/contexts/authContext.dart';
import 'package:flutterpractic/modules/auth/validators/email.dart';
import 'package:flutterpractic/modules/auth/validators/password.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authContext = ref.watch(authProvider);
    final formKey = useState(GlobalKey<FormState>());
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    final errorNotifier = useState<String?>(null);

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
                    ValueListenableBuilder(
                      valueListenable: errorNotifier,
                      builder: (context, String? serverError, _) {
                        return TextFormField(
                          controller: usernameController,
                          onChanged: (value) => errorNotifier.value = null,
                          validator: emailValidator,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: const OutlineInputBorder(),
                            errorText: serverError,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => errorNotifier.value = null,
                      controller: passwordController,
                      obscureText: true,
                      validator: passwordValidator,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        errorNotifier.value = null;
                        if (!formKey.value.currentState!.validate()) return;

                        ref.read(authProvider.notifier).login(
                              email: usernameController.text,
                              password: passwordController.text,
                              notifier: errorNotifier,
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
}
