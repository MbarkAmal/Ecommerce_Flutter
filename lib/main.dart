import 'package:flutter/material.dart';
import 'package:flutter_app/providers/cart_providers.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CartProviders(),
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
     ); //     );
  }
}