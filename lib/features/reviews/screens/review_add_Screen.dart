import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';
import '../../shared/utils/validators.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  static const String name = '/add-review';

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = .new();
  final TextEditingController _lastNameTEController = .new();
  final TextEditingController _reviewTEController = .new();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Review')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  validator: (value) =>
                      Validators.validateText(value, 'First name is required'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  validator: (value) =>
                      Validators.validateText(value, 'Last name is required'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _reviewTEController,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    hintText: 'Write Review',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  validator: (value) =>
                      Validators.validateText(value, 'Review cannot be empty'),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.themeColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _onTapSubmitButton,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _reviewTEController.dispose();
    super.dispose();
  }
}
