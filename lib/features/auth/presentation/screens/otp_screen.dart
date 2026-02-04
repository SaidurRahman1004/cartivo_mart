import 'dart:async';
import 'package:cartivo_mart/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Timer _timer;
  int _start = 120;
  bool _canResend = false;

  void startTimer() {
    _canResend = false;
    _start = 120;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 120),
                const AppLogo(height: 80),
                const SizedBox(height: 24),
                Text('Enter OTP Code', style: context.textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  'A 4 Digit OTP Code has been Sent',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  controller: _otpTEController,
                  appContext: context,
                  length: 4,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: AppColors.themeColor,
                    inactiveColor: Colors.grey.shade300,
                    selectedColor: AppColors.themeColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _onTapNextButton,
                  child: const Text('Next'),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      const TextSpan(text: 'This code will expire in '),
                      TextSpan(
                        text:
                            '$_start'
                            's',
                        style: const TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: _canResend ? _onTapResendCode : null,
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                      color: _canResend ? AppColors.themeColor : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() {
    if (_formKey.currentState!.validate()) {}
  }

  void _onTapResendCode() {
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpTEController.dispose();
    super.dispose();
  }
}
