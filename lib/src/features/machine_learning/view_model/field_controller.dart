import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fieldProvider = ChangeNotifierProvider((ref) {
  return TextFieldController();
});

class TextFieldController extends ChangeNotifier {
  bool _readModulus = true;

  bool get readModulus => _readModulus;

  void setModulus() {
    _readModulus = !_readModulus;
    notifyListeners();
  }

  bool _readTemperature = true;

  bool get readTemperature => _readTemperature;

  void setTemperature() {
    _readTemperature = !_readTemperature;
    notifyListeners();
  }

  bool _readVelocity = true;

  bool get readVelocity => _readVelocity;

  void setVelocity() {
    _readVelocity = !_readVelocity;
    notifyListeners();
  }

  bool _readModes = true;

  bool get readModes => _readModes;

  void setModes() {
    _readModes = !_readModes;
    notifyListeners();
  }
}
