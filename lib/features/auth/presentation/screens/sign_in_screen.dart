import 'package:flutter/material.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/utils/validators.dart';
import '../widgets/app_logo.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  const AppLogo(),
                  const SizedBox(height: 24),
                  Text('Welcome Back', style: context.textTheme.titleLarge),
                  Text(
                    'Sign in with your email and password',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (value) =>
                        Validators.validateEmail(value, 'Email is required'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password'),
                    validator: (value) =>
                        Validators.validatePassword(value),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _onTapSignInButton,
                    child: const Text('Sign In'),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Need an account? "),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.name);
                        },
                        child: const Text('Sign Up'),
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

  void _onTapSignInButton() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Perform Sign In logic
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}