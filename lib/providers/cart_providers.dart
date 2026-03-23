import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProviders extends ChangeNotifier{
  List<Product> cart = [];

  void add(Product product) {
    cart.add(product);
    notifyListeners() ; // update ui everywhere
  }

  //remove cart item
  void remove (int index) {
    cart.removeAt(index);
    notifyListeners() ;
  }

  //
  // ➕ Increase quantity
   void increaseQty(int index) {
    cart[index].quantity++ ;
    notifyListeners() ;
   }
  
// ➖ Decrease quantity
  void decreaseQty(int index) {
    if (cart[index].quantity > 1) {
      cart[index].quantity--;
    }
    notifyListeners();
  }
  //total price 
   double get totalPrice {
    double total = 0;

    for (var item in cart) {
      total += item.price * item.quantity;
    }

    return total;
  }
}

