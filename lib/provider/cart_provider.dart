import 'package:flutter/foundation.dart';
import 'package:teststore/model/product_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, Product> _items = {};

  Map<String, Product> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price;
    });
    return total;
  }

  void addItem(Product prod) {
    if (_items.containsKey(prod.id)) {
      _items.update(
        prod.id,
        (existingCartItem) => Product(
          description: prod.description,
          id: prod.id,
          imageUrl: prod.imageUrl,
          price: prod.price,
          title: prod.title,
        ),
      );
    } else {
      _items.putIfAbsent(
        prod.id,
        () => Product(
          description: prod.description,
          id: prod.id,
          imageUrl: prod.imageUrl,
          price: prod.price,
          title: prod.title,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
