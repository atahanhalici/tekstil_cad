import 'package:flutter/material.dart';
import 'package:tekstil_cad/locator.dart';
import 'package:tekstil_cad/models/3d_model.dart';
import 'package:tekstil_cad/repository/repo.dart';

enum ViewState { geliyor, geldi, hata, ayarlama }

class ModelViewModel with ChangeNotifier {
  final Repository _repository = locator<Repository>();
  ViewState _state = ViewState.geldi;
  ViewState get state => _state;
  late List<Model> asd;
  bool autoPlay = false;

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
      List<Model> asd = [Model(adi: "", resim: "", aciklama: "", link: "")];
      return asd;
    }
  }

  ayarlama(bool yeni) {
    state = ViewState.ayarlama;
    autoPlay = yeni;
    state = ViewState.geldi;
  }
}
