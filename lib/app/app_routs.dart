import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/otp_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';


class AppRouts {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    //Emty Sizebox widget as default backup
    Widget widget = SizedBox();
    //settings.name  contains the route name passed in Navigator.pushNamed where we navigate to
    switch (settings.name){
      case SplashScreen.name:
        widget = const SplashScreen();
        break;
      case SignUpScreen.name:
        widget = const SignUpScreen();
        break;
      case OtpScreen.name:
        widget = const OtpScreen();
        break;


    }
    //Return the page route with the selected widget
    return MaterialPageRoute(builder: (context) => widget);
  }
}