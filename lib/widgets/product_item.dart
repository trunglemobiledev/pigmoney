import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teststore/model/product_model.dart';
import 'package:teststore/model/cart_model.dart';
import 'package:teststore/provider/cart_provider.dart';
import 'package:teststore/screens/cart_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Card(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Text(
              //   '\$${product.price}',
              //   style: const TextStyle(
              //     fontSize: 16,
              //     color: Colors.grey,
              //   ),
              // ),
              IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {
                  cartProvider.removeItem(product.id);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Xóa san phảm ${product.title}"),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          cartProvider.addItem(product);
                        },
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  cartProvider.addItem(product);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Thêm thành công!${product.title}"),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          cartProvider.removeItem(product.id);
                        },
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () {
                  cartProvider.clearCart();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Đã xóa tất cả trong cart'),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          // cartProvider.removeItem(product.id);
                        },
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.card_travel),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CartScreen()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
