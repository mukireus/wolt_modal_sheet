import 'package:coffee_maker_navigator_2/features/login/di/login_screen_dependency_container.dart';
import 'package:coffee_maker_navigator_2/features/login/ui/view_model/login_screen_view_model.dart';
import 'package:demo_ui_components/demo_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:wolt_di/wolt_di.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with
        FeatureWithViewModelDependencyContainerSubscriptionMixin<
            LoginScreenDependencyContainer, LoginScreenViewModel, LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(
                    image: AssetImage('lib/assets/images/dash_coffee.webp'),
                    fit: BoxFit.cover,
                    height: 216,
                    width: 384,
                  ),
                  Text(
                    'Welcome to Coffee Maker!',
                    style: textTheme.titleLarge!,
                  ),
                  const SizedBox(height: 50),
                  const AppTextFormField(
                    labelText: 'Username',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  const AppTextFormField(
                    labelText: 'Password',
                    obscureText: true,
                    autocorrect: false,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 30),
                  WoltElevatedButton(
                    onPressed: () {
                      viewModel.onLoginPressed('email', 'password');
                    },
                    child: const Text('Sign in'),
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