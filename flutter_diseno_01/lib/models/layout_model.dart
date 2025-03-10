import 'package:flutter/material.dart';
import 'package:flutter_01/pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideshowPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }
}
