import 'package:flutter/material.dart';
import 'package:teststore/model/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: '1',
      title: 'Product 1',
      description: 'Product 1',
      price: 200.5,
      imageUrl: 'https://via.placeholder.com/150',
      isFavorite: false,
    ),
    Product(
      id: '2',
      title: 'Product 2',
      description: 'Product 2',
      price: 23213.5,
      imageUrl: 'https://via.placeholder.com/150',
      isFavorite: false,
    ),
    Product(
      id: '3',
      title: 'Product 3',
      description: 'Product 3',
      price: 21321.5,
      imageUrl: 'https://via.placeholder.com/150',
      isFavorite: false,
    ),
    Product(
      id: '4',
      title: 'Product 4',
      description: 'Product 4',
      price: 34234.5,
      imageUrl: 'https://via.placeholder.com/150',
      isFavorite: false,
    ),
    Product(
      id: '5',
      title: 'Product 5',
      description: 'Product 5',
      price: 345435.5,
      imageUrl: 'https://via.placeholder.com/150',
      isFavorite: false,
    ),
    Product(
      id: '6',
      title: 'Product 6',
      description: 'Product 5',
      price: 345345.5,
      imageUrl: 'https://via.placeholder.com/150',
      isFavorite: false,
    ),
  ];

  List<Product> getItems() {
    return [..._items];
  }

  // Các phương thức khác để quản lý danh sách sản phẩm
}
