import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier{

  //default languages
  Locale _currentLocale = const Locale('en');
  Locale get currentLocale => _currentLocale;
  //all supported languages list
  List<Locale> _supportedLocales = const [
    Locale('en'),
    Locale('bn'),
  ];
  List<Locale> get supportedLocale => _supportedLocales;

  //change language method
  void changeLanguage(Locale locale){
    _currentLocale =locale;
    notifyListeners();
  }
}