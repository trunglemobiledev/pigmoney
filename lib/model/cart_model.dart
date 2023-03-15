import 'package:flutter/foundation.dart';
import 'package:teststore/model/product_model.dart';

class Cart with ChangeNotifier {
  final Map<Product, int> _items = {};

  Map<Product, int> get items => _items;

  int get itemCount => _items.length;

  void addItem(Product product) {
    if (_items.containsKey(product)) {
      _items.update(product, (value) => value + 1);
    } else {
      _items[product] = 1;
    }
    notifyListeners();
  }
}
