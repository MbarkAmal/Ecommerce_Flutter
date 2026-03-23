import 'package:flutter/material.dart';
import 'package:flutter_app/providers/cart_providers.dart';
import 'package:flutter_app/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
final Product product ;

  const ProductDetailScreen({ required this.product });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.image, height: 300, width: double.infinity, fit: BoxFit.cover),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("\$${product.price}", style: TextStyle(fontSize: 18, color: Colors.green)),
                ElevatedButton(
                  onPressed: () {
                    //add to cart using provider 
                    context.read<CartProviders>().add(product);
                    // go to cart screeen 
                    Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) =>CartScreen(),));
                  },
                 child: Text("Add to Cart"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}