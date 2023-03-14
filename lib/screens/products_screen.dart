import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teststore/provider/product_provider.dart';
import 'package:teststore/widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/products';

  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = productsData.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(5.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: const ProductItem(),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }
}
