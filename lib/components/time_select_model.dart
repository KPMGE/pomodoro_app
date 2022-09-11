import 'package:flutter/material.dart';

class TimeSelectModel extends ChangeNotifier {
  // initial state
  double _time = 0.0;

  // state getter
  double get time => _time;

  // state setter
  void setTime(double value) {
    _time = value;
    // notify all the consumers
    notifyListeners();
  }
}
