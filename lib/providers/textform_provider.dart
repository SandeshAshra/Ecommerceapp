import 'package:flutter/cupertino.dart';

class Textformprovider with ChangeNotifier {
  bool _isObscure = true;

  bool get isObscure => _isObscure;

  void toggleVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
