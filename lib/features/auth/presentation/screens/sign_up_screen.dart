import 'package:flutter/material.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/utils/validators.dart';
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 48),
                  const AppLogo(),
                  const SizedBox(height: 24),
                  Text('Sign Up With Email', style: context.textTheme.titleLarge),
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
                    validator: (value) =>
                        Validators.validateText(value, 'First name is required'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _lNameTEController,
                    decoration: const InputDecoration(hintText: 'Last Name'),
                    validator: (value) =>
                        Validators.validateText(value, 'Last name is required'),
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
                  FilledButton(
                    onPressed: _onTapSignUpButton,
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 20,),
                  TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, OtpScreen.name);
                  }, child: Text(' Otp Page')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Implement sign up logic
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
}