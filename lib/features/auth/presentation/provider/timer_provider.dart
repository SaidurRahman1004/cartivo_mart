import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int _remainingSeconds = 0;
  Timer? _timer;
  bool _isRunning = false;

  int get remainingSeconds => _remainingSeconds;

  bool get isRunning => _isRunning;

  void startTimer(int seconds) {
    if (_isRunning) return;

    _remainingSeconds = seconds;
    _isRunning = true;
    //stop previous timr if any
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}