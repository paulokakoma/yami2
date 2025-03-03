import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<Product, int> _cartItems = {}; // Armazena produto e quantidade

  Map<Product, int> get cartItems => _cartItems;

  void addToCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1; // Aumenta a quantidade
    } else {
      _cartItems[product] = 1; // Adiciona novo produto
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (_cartItems.containsKey(product)) {
      if (_cartItems[product]! > 1) {
        _cartItems[product] = _cartItems[product]! - 1; // Diminui a quantidade
      } else {
        _cartItems.remove(product); // Remove do carrinho se for o último
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  int get cartCount {
    return _cartItems.values.fold(0, (sum, quantity) => sum + quantity);
  }

  double get totalPrice {
    return _cartItems.entries
        .fold(0, (sum, item) => sum + (item.key.price * item.value));
  }

  List<Product> get uniqueProducts => _cartItems.keys.toList();
}
