import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _correctAns1 = 0;
  int get correctAns1 => _correctAns1;
  set correctAns1(int value) {
    _correctAns1 = value;
  }

  int _correctAns2 = 0;
  int get correctAns2 => _correctAns2;
  set correctAns2(int value) {
    _correctAns2 = value;
  }

  int _correctAns5 = 0;
  int get correctAns5 => _correctAns5;
  set correctAns5(int value) {
    _correctAns5 = value;
  }

  int _correctAns3 = 0;
  int get correctAns3 => _correctAns3;
  set correctAns3(int value) {
    _correctAns3 = value;
  }

  int _correctAns4 = 0;
  int get correctAns4 => _correctAns4;
  set correctAns4(int value) {
    _correctAns4 = value;
  }

  bool _showFeedback = false;
  bool get showFeedback => _showFeedback;
  set showFeedback(bool value) {
    _showFeedback = value;
  }
}
