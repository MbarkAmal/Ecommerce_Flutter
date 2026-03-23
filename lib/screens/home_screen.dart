import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/bar.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: "iPhone 13",
      price: 999,
      image: "https://i.pinimg.com/736x/07/95/77/079577cd1e880a27e38cca57b98e604c.jpg",
      quantity: 1,
    ),
    Product(
      title: "Laptop",
      price: 999,
      image: "https://i.pinimg.com/736x/20/4e/90/204e905bfc7f55c45f3a0eeddc2431c9.jpg",
        quantity: 1,
    ),
    Product(
      title: "Headphone",
      price: 999,
      image: "https://i.pinimg.com/736x/57/71/2f/57712f7c1014b09b3a76437adb471a98.jpg",
      quantity: 1,
    ),
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Grinato "),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              product: products[index],
            );
          },
        ),
      ),
    );
  }
}