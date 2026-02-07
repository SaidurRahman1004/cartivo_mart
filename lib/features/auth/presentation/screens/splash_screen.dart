import 'package:cartivo_mart/app/extensions/localization_extension.dart';
import 'package:cartivo_mart/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:cartivo_mart/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

import '../../../shared/presentation/screens/main_nav_holder_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Expanded(child: AppLogo(height: 120,)),
              CircularProgressIndicator(),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _navigateToNextPage() async{
    await Future.delayed(const  Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, MainNavHolderScreen.name);
  }
}
