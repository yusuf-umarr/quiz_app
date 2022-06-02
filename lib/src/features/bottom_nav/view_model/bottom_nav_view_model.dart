import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavViewModel extends ChangeNotifier {
  int currentIndex = 0;

  setCurrentIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}
