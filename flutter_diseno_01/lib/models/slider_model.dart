// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

class SliderModel extends ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}
