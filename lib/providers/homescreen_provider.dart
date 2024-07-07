import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/cupertino.dart';

import '../brandsdata.dart';

class HomepageProvider with ChangeNotifier {
  int _selectedindex = 0;
  int get selectedindex => _selectedindex;


  int _selectedindex1 = 0;
  List<Product> _filteredProducts = [];
  int get selectedindex1 => _selectedindex1;
  List<Product> get filteredProducts => _filteredProducts;

  void updateSelectedIndex(int index) {
    _selectedindex = index;
    notifyListeners();
  }

  void updateSelectedIndex1(int index) {
    _selectedindex1 = index;
    filterProductsByBrand(index);
    notifyListeners();
  }

  void filterProductsByBrand(int index) {
    if (index == 0) {
      _filteredProducts = products;
    } else {
      _filteredProducts = products
          .where((product) => product.brand == brands[index].name)
          .toList();
    }
    notifyListeners();
  }

}
