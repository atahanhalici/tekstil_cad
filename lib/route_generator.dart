import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tekstil_cad/main.dart';
import 'package:tekstil_cad/pages/model_page.dart';
import 'package:tekstil_cad/pages/my_models_page.dart';

class RouteGenerator {
  static Route<dynamic>? _gidilecekrota(Widget gidilecekWidget) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(builder: (context) => gidilecekWidget);
    } else {
      return MaterialPageRoute(builder: (context) => gidilecekWidget);
    }
  }

  static Route<dynamic>? rotaOlustur(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _gidilecekrota(const MyHomePage());
      case '/modellerim':
        return _gidilecekrota(const MyModelsPage());

      default:
        return _gidilecekrota(const MyHomePage());
    }
  }
}
