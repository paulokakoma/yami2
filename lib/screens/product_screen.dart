import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/cart_bottom_bar.dart';

class ProductScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Feijão Carioca",
      price: 4.99,
      image: "assets/images/carioca.jpg",
      description:
          "Feijão carioca de alta qualidade, ideal para refeições saborosas.",
    ),
    Product(
      name: "Feijão Fradinho",
      price: 5.50,
      image: "assets/images/fradinho.jpg",
      description: "Feijão fradinho perfeito para saladas e pratos típicos.",
    ),
    Product(
      name: "Feijão Branco",
      price: 6.30,
      image: "assets/images/branco.jpeg",
      description: "Feijão branco excelente para sopas e pratos nutritivos.",
    ),
    Product(
      name: "Feijão Preto",
      price: 4.50,
      image: "assets/images/preto.png",
      description: "Feijão preto tradicional, essencial na feijoada.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Produtos")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
      bottomNavigationBar: CartBottomBar(),
    );
  }
}
