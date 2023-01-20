import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode mode = ThemeMode.light;

  void changelang(String lang) {
    languageCode = lang;
    notifyListeners();
  }

  void changeTheme(ThemeMode modee) {
    mode = modee;
    notifyListeners();
  }
}
