import 'package:flutter/material.dart';

import 'app_routs.dart';

class CartivoApp extends StatelessWidget {
  const CartivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRouts.onGenerateRoute,
    );
  }
}
