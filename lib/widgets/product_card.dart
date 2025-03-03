import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image.asset(product.image, height: 80, fit: BoxFit.cover),
            Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text("\$${product.price.toStringAsFixed(2)}",
                style: TextStyle(color: Colors.purple)),
          ],
        ),
      ),
    );
  }
}
