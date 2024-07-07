import 'package:flutter/cupertino.dart';

class ProductcardProvider with ChangeNotifier {
  int _selectedindex = 0;

  int get selectedindex => _selectedindex;

  void updateSelectedIndex(int index) {
    _selectedindex = index;
    notifyListeners();
  }
}
