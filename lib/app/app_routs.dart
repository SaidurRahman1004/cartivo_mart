import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../auth/presentation/screens/splash_screen.dart';

class AppRouts {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    //Emty Sizebox widget as default backup
    Widget widget = SizedBox();
    //settings.name  contains the route name passed in Navigator.pushNamed where we navigate to
    switch (settings.name){
      case '/' :
      widget = const SplashScreen();
      break;

    }
    //Return the page route with the selected widget
    return MaterialPageRoute(builder: (context) => widget);
  }
}