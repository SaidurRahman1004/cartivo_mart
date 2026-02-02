import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'app/cartivo_app.dart';
import 'firebase_options.dart';

void main() async{
  //initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//flutter Fatal Errors error handling
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

//Async uncought errors handling
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const CartivoApp());
}

