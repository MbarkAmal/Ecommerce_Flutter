
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/product_detail_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'product_detail_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///  change screen here
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),

      /// 🔻 navbar here
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}