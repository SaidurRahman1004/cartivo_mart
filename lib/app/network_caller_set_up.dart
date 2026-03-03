import 'package:flutter/material.dart';

import '../core/services/network_caller.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import 'cartivo_app.dart';

NetworkCaller getNetworkCaller(){
  return NetworkCaller(headers: {'token': 'token', 'content-type': 'application/json'}, onUnauthorize: (){
    _moveToSignInScreen();
  });
}

void _moveToSignInScreen() {
  Navigator.pushNamed(
    CartivoApp.navigatorKey.currentContext!,
    SignInScreen.name,
  );
}