import 'package:flutter/services.dart';

class ExponentialInputFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r'^[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d*)?$');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty || _regExp.hasMatch(newValue.text)) {
      // If the new input matches the regex, allow the change
      return newValue;
    } else {
      // If the new input doesn't match, return the old value
      return oldValue;
    }
  }
}
