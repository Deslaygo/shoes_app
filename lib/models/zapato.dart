import 'package:flutter/foundation.dart';
import 'package:shoes_app/app_assets.dart';

class Zapato with ChangeNotifier {
  String _imageAsset = AppAssets.zapatoAmarillo;
  int _talla = 24;

  String get imageAsset => _imageAsset;
  set imageAsset(String asset) {
    _imageAsset = asset;
    notifyListeners();
  }

  int get talla => _talla;
  set talla(int talla) {
    _talla = talla;
    notifyListeners();
  }
}
