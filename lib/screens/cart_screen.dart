import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teststore/provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/products';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giỏ hàng"),
      ),
      body: Center(
        child: Text(context.watch<CartProvider>().itemCount.toString()),
      ),
    );
  }
}
