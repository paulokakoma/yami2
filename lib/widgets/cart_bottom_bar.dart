import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Miniaturas dos produtos no carrinho com quantidade
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: cartProvider.cartItems.entries.map((entry) {
                    final product = entry.key;
                    final quantity = entry.value;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: ClipOval(
                                child: Image.asset(
                                  product.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          if (quantity > 1) // Mostra a quantidade no canto
                            Positioned(
                              right: 0,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red,
                                child: Text(
                                  quantity.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Ícone do carrinho com contador
              Stack(
                children: [
                  Icon(Icons.shopping_cart, color: Colors.white, size: 30),
                  if (cartProvider.cartCount > 0)
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          cartProvider.cartCount.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
