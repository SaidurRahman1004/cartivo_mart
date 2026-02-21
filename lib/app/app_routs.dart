import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/otp_screen.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/products/presentation/screens/product_details_screen.dart';
import '../features/products/presentation/screens/product_list_screen.dart';
import '../features/reviews/screens/review_add_Screen.dart';
import '../features/reviews/screens/reviews_screen.dart';
import '../features/shared/presentation/screens/main_nav_holder_screen.dart';


class AppRouts {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    //Emty Sizebox widget as default backup
    Widget widget = SizedBox();
    //settings.name  contains the route name passed in Navigator.pushNamed where we navigate to
    switch (settings.name){
      case SplashScreen.name:
        widget = const SplashScreen();
        break;
      case SignInScreen.name:
        widget = const SignInScreen();
        break;
      case SignUpScreen.name:
        widget = const SignUpScreen();
        break;
      case OtpScreen.name:
        widget = const OtpScreen();
        break;
      case MainNavHolderScreen.name:
        widget = const MainNavHolderScreen();
        break;
      case ProductListScreen.name:
        final categoryName = settings.arguments as String;
        widget = ProductListScreen(categoryName: categoryName);
        break;
      case ProductDetailsScreen.name:
        widget = ProductDetailsScreen();
        break;
      case ReviewScreen.name:
        widget = ReviewScreen();
        break;
      case AddReviewScreen.name:
        widget = AddReviewScreen();
        break;



    }
    //Return the page route with the selected widget
    return MaterialPageRoute(builder: (context) => widget);
  }
}