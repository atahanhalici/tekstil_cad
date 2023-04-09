import 'package:flutter/material.dart';
import 'package:tekstil_cad/locator.dart';
import 'package:tekstil_cad/models/user.dart';
import 'package:tekstil_cad/repository/repo.dart';

enum ViewState { geliyor, geldi, hata }

class UserViewModel with ChangeNotifier {
  final Repository _repository = locator<Repository>();
  ViewState _state = ViewState.geliyor;
  ViewState get state => _state;
  User user = User(adi: "", soyadi: "", sirket: "", mail: "", kullanici_id: "");

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  Future<User> userGetir() async {
    await Future.delayed(const Duration(seconds: 1));
    state = ViewState.geliyor;
    try {
      user = await _repository.userGetir();
      state = ViewState.geldi;
      return user;
    } catch (e) {
      state = ViewState.hata;
      return user;
    }
  }
}
