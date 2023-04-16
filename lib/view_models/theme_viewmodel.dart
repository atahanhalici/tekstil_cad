import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum ThemeMod { light, dark }

enum States {
  bos,
  ilk,
  geliyor,
  geldi,
}

class ThemeViewModel with ChangeNotifier {
  var box = Hive.box("informations");
  ThemeMod _state =
      WidgetsBinding.instance.window.platformBrightness == Brightness.light
          ? ThemeMod.light
          : ThemeMod.dark;
  ThemeMod get state => _state;
  States _states = States.bos;
  States get states => _states;
  set state(ThemeMod value) {
    _state = value;
    notifyListeners();
  }

  set states(States value) {
    _states = value;
    notifyListeners();
  }

  asd() async {
    var tema = box.get("tema");
    tema ??=
        WidgetsBinding.instance.window.platformBrightness == Brightness.light
            ? "light"
            : "dark";

    await Future.delayed(const Duration(seconds: 5));
    tema == "light" ? themeLightilk() : themeDarkilk();
    /* box.clear();
    await Future.delayed(const Duration(milliseconds: 100));
    states = States.geldi;
    var tema = box.get("tema");
    print(tema);*/
  }

  themeLight() async {
    states = States.geliyor;
    state = ThemeMod.light;
    box.put("tema", "light");
    await Future.delayed(const Duration(milliseconds: 100));
    states = States.geldi;
  }

  themeLightilk() async {
    states = States.geliyor;
    state = ThemeMod.light;
    await Future.delayed(const Duration(milliseconds: 100));
    states = States.ilk;
  }

  dilDegis() async {
    states = States.geliyor;
    await Future.delayed(const Duration(milliseconds: 100));
    states = States.geldi;
  }

  themeDark() async {
    states = States.geliyor;
    state = ThemeMod.dark;
    box.put("tema", "dark");
    await Future.delayed(const Duration(milliseconds: 100));
    states = States.geldi;
  }

  themeDarkilk() async {
    states = States.geliyor;
    state = ThemeMod.dark;
    await Future.delayed(const Duration(milliseconds: 100));
    states = States.ilk;
  }
}
