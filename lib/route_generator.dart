import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tekstil_cad/pages/home_page.dart';
import 'package:tekstil_cad/pages/login_page.dart';
import 'package:tekstil_cad/pages/my_models_page.dart';
import 'package:tekstil_cad/pages/profile_page.dart';
import 'package:tekstil_cad/pages/settings_page.dart';

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
        return _gidilecekrota(const HomePage());
      case '/modellerim':
        return _gidilecekrota(const MyModelsPage());
      case '/profil':
        return _gidilecekrota(const ProfilePage());
 case '/login':
        return _gidilecekrota(const LoginPage());
        case '/ayarlar':
        return _gidilecekrota(const SettingsPage());
      default:
        return _gidilecekrota(const HomePage());
    }
  }
}
