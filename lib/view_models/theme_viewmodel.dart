import 'package:flutter/material.dart';

enum ThemeMod { light, dark }

class ThemeViewModel with ChangeNotifier {
  ThemeMod _state = ThemeMod.light;
  ThemeMod get state => _state;

  set state(ThemeMod value) {
    _state = value;
    notifyListeners();
  }

  themeLight() {
    state = ThemeMod.light;
  }

  themeDark() {
    state = ThemeMod.dark;
  }
}
