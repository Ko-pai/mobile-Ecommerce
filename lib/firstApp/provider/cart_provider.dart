import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testp/firstApp/model/products.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleCart(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }

    notifyListeners();
  }

  increasementQuantity(int index) => _cart[index].quantity++;
  decreasementQuantity(int index) =>
      _cart[index].quantity <= 0 ? 1 : _cart[index].quantity--;

  getTotalPrice() {
    double total = 0;
    for (Product element in _cart) {
      total += element.price * element.quantity;
    }
    return total;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
