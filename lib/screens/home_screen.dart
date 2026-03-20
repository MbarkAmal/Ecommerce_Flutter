import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Shop"),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2, // 2 cards per row
          childAspectRatio: 0.75,
          children: [
            ProductCard(
              title: "iPhone 13",
              price: 999,
              image: "https://i.pinimg.com/736x/07/95/77/079577cd1e880a27e38cca57b98e604c.jpg",
            ),
            ProductCard(
              title: "Laptop",
              price: 1200,
              image: "https://i.pinimg.com/736x/82/4d/ae/824dae5a6f833dafc42e996e8fd34596.jpg",
            ),
            ProductCard(
              title: "Headphones",
              price: 150,
              image: "https://i.pinimg.com/1200x/57/71/2f/57712f7c1014b09b3a76437adb471a98.jpg",
            ),
          ],
        ),
      ),
    );
  }
}