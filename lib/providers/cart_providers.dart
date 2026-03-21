import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProviders extends ChangeNotifier{
  List<Product> cart = [];

  void add(Product product) {
    cart.add(product);
    notifyListeners() ; // update ui everywhere
  }
}

