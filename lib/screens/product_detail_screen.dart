import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(product.image, height: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("\$${product.price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20, color: Colors.purple)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(product);
                Navigator.pop(context);
              },
              child: Text("Adicionar ao Carrinho"),
            ),
          ],
        ),
      ),
    );
  }
}
