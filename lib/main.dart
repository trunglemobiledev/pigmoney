import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teststore/model/cart_model.dart';
import 'package:teststore/provider/product_provider.dart';
import 'package:teststore/screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MaterialApp(
        title: 'Test Store',
        home: ProductsScreen(),
      ),
    );
  }
}
