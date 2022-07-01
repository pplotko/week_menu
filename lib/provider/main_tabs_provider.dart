import 'package:flutter/material.dart';

class MainTabsProvider extends ChangeNotifier {
  var _currentTableIndex = 0;

  int get currentTableIndex => _currentTableIndex;

  void onItemTapped(int value) {
    _currentTableIndex = value;
    print('_currentTableIndex = $_currentTableIndex');
    notifyListeners();
  }
}