import 'package:cartivo_mart/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:cartivo_mart/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/utils/validators.dart';
import '../../data/models/sign_up_params.dart';
import '../provider/sign_up_provider.dart';
import '../widgets/app_logo.dart';
import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _fNameTEController = TextEditingController();
  final TextEditingController _lNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final SignUpProvider _signUpProvider = SignUpProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _signUpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 48),
                    const AppLogo(),
                    const SizedBox(height: 24),
                    Text(
                      'Sign Up With Email',
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      'Get started with your details',
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
                      controller: _fNameTEController,
                      decoration: const InputDecoration(hintText: 'First Name'),
                      validator: (value) => Validators.validateText(
                        value,
                        'First name is required',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _lNameTEController,
                      decoration: const InputDecoration(hintText: 'Last Name'),
                      validator: (value) => Validators.validateText(
                        value,
                        'Last name is required',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(hintText: 'Mobile'),
                      validator: (value) =>
                          Validators.validateText(value, 'Enter mobile number'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _cityTEController,
                      decoration: const InputDecoration(hintText: 'City'),
                      validator: (value) =>
                          Validators.validateText(value, 'Enter city name'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: (value) => Validators.validatePassword(value),
                    ),
                    const SizedBox(height: 24),
                    Consumer<SignUpProvider>(
                      builder: (context, signUpProvider, _) {
                        if (signUpProvider.signUpInProgress) {
                          return CircularProgressIndicator();
                        }
                        return FilledButton(
                          onPressed: _onTapSignUpButton,
                          child: const Text('Sign Up'),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    //Temporary
                    TextButton(
                      onPressed: _onTapSignInButton,
                      child: Text('Already have an account? Sign in'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState?.validate() ?? false) {
      _signUp();
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _fNameTEController.dispose();
    _lNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  Future<void> _signUp() async {
    SignUpParams params = SignUpParams(
      firstName: _fNameTEController.text.trim(),
      lastName: _lNameTEController.text.trim(),
      email: _emailTEController.text.trim(),
      phone: _mobileTEController.text.trim(),
      city: _cityTEController.text.trim(),
      password: _passwordTEController.text,
    );
    final bool isSuccess = await _signUpProvider.signUp(params);
    if (isSuccess) {
      Navigator.pushNamed(context, OtpScreen.name);
    } else {
      showSnackBarMessage(context, _signUpProvider.errorMessage!);
    }
  }
}
