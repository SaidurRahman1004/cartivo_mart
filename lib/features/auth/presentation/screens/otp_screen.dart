import 'package:cartivo_mart/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';
import '../widgets/resend_otp_section.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  static const String name = '/otp';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  pinTheme: AppTheme.otpPinTheme,
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
                const SizedBox(height: 15,),
                ResendOtpSection(),
                const SizedBox(height: 16),
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

}
