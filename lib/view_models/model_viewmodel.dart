import 'package:flutter/material.dart';
import 'package:tekstil_cad/locator.dart';
import 'package:tekstil_cad/models/3d_model.dart';
import 'package:tekstil_cad/repository/repo.dart';

enum ViewState { geliyor, geldi, hata }

class ModelViewModel with ChangeNotifier {
  final Repository _repository = locator<Repository>();
  ViewState _state = ViewState.geldi;
  ViewState get state => _state;
  List<Model> asd = [Model(adi: "", resim: "", aciklama: "", link: "")];

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  Future<List<Model>> modelleriGetir() async {
    state = ViewState.geliyor;
    try {
      asd = await _repository.modelleriGetir();
      state = ViewState.geldi;
      return asd;
    } catch (e) {
      state = ViewState.hata;
      return asd;
    }
  }
}
