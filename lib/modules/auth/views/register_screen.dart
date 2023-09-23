import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/core/contexts/auth_context.dart';
import 'package:flutterpractic/modules/auth/validators/confirmpassword.dart';
import 'package:flutterpractic/modules/auth/validators/email.dart';
import 'package:flutterpractic/modules/auth/validators/password.dart';
import 'package:flutterpractic/modules/auth/validators/username.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState(GlobalKey<FormState>());
    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    // ValueNotifier for server-side validation errors
    final userOrEmailErrorNotifier = useState<String?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: userOrEmailErrorNotifier,
                    builder: (context, String? serverError, _) => TextFormField(
                      controller: usernameController,
                      onChanged: (value) {
                        userOrEmailErrorNotifier.value = null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: const OutlineInputBorder(),
                        errorText:
                            serverError, // Show server error if it exists
                      ),
                      validator: usernameValidator,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: userOrEmailErrorNotifier,
                    builder: (context, String? serverError, _) => TextFormField(
                      controller: emailController,
                      onChanged: (value) {
                        userOrEmailErrorNotifier.value = null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: const OutlineInputBorder(),
                        errorText:
                            serverError, // Show server error if it exists
                      ),
                      validator: emailValidator,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: passwordValidator,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => confirmPasswordValidator(
                            value,
                            passwordController.text,
                          )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      userOrEmailErrorNotifier.value = null;
                      if (formKey.value.currentState!.validate()) {
                        /* ref.read(authProvider.notifier).login(
                              email: usernameController.text,
                              password: passwordController.text,
                              notifier: userOrEmailErrorNotifier,
                            ); */

                        /* final user = CreateUser(
                          username:
                              _usernameController.text.trim().toLowerCase(),
                          email: _emailController.text.trim().toLowerCase(),
                          password: _passwordController.text.trim(),
                          confirmPassword:
                              _confirmPasswordController.text.trim(),
                        );

                        (() async {
                          try {
                            final metaUser = await createUserService(
                                user, _handleServerError);

                            if (metaUser != null && context.mounted) {
                              authContext.setMetaUser(metaUser);
                              context.go('/list-chats');
                            }
                          } catch (error) {
                            print(error);
                          }
                        })(); */
                      }
                    },
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          context.go('/auth/login');
                        },
                        child: Text(
                          'Login',
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
        ),
      ),
    );
  }
}
