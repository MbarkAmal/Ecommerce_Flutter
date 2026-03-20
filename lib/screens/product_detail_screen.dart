import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  final double price;
  final String image;

  const ProductDetailScreen({
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(image, height: 250, width: double.infinity, fit: BoxFit.cover),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("\$${price}", style: TextStyle(fontSize: 18, color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}