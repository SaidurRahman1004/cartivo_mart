import 'package:flutter/foundation.dart';

class MainNavProvider extends ChangeNotifier{
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void changeSelectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }

  void moveToCategory() {
    changeSelectedIndex(1);
  }

  void backToHome() {
    changeSelectedIndex(0);
  }
}