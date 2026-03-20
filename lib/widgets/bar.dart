import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({this.title = "eco"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(
            Icons.store, // 🛒 change this icon if you want
            size: 28,
          ),
          SizedBox(width: 10),
          Text(title),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {
            // go to favorites
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            // go to cart
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}