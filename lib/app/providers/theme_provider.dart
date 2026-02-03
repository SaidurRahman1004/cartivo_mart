import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier{
  //default theme mode
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  //change theme method
  void toggleTheme(bool isDarkMode){
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}