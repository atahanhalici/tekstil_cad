import 'package:flutter/material.dart';

enum ThemeMod { light, dark }

enum States {
  ilk,
  geliyor,
  geldi,
}

class ThemeViewModel with ChangeNotifier {
  ThemeMod _state = ThemeMod.light;
  ThemeMod get state => _state;
  States _states = States.ilk;
  States get states => _states;
  bool otoDondur = false;
  set state(ThemeMod value) {
    _state = value;
    notifyListeners();
  }

  set states(States value) {
    _states = value;
    notifyListeners();
  }

  themeLight() async {
    states = States.geliyor;
    state = ThemeMod.light;
    await Future.delayed(const Duration(milliseconds: 100));
    states = States.geldi;
  }

  dilDegis() async {
    states = States.geliyor;
    await Future.delayed(const Duration(milliseconds: 100));
    states = States.geldi;
  }

  otoDondurme(bool value) async {
    states = States.geliyor;
    otoDondur = value;
    await Future.delayed(const Duration(milliseconds: 100));
    states = States.geldi;
  }

  themeDark() async {
    states = States.geliyor;
    state = ThemeMod.dark;
    await Future.delayed(const Duration(milliseconds: 100));
    states = States.geldi;
  }
}
