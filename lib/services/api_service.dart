import 'dart:convert'; // convert Json t DART objects 
import 'package:http/http.dart' as http; // allows to make http resuests (get , post )
import 'package:flutter_app/models/product.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb : detect if the app run in web or mobile 

//  FOR WEB: use "localhost"
//  FOR ANDROID EMULATOR: use "10.0.2.2"
//  FOR PHYSICAL PHONE: use your PC's IP address (e.g., "192.168.1.10")
const String baseUrl = kIsWeb ? "http://localhost:3000" : "https://ivy-rhinencephalous-rosamaria.ngrok-free.dev";

Future<List<Product>> getProducts() async { // async func that return a list of products (takes time )
  try {
    print("Fetching products from: $baseUrl/products");
    final response = await http.get(Uri.parse('$baseUrl/products'));

    print("Response status: ${response.statusCode}");
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body); // convert Json  TO DART
      print("Products loaded successfully: ${data.length} items");

      return data
          .map<Product>((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      print("Failed to load products: ${response.statusCode}");
      throw Exception("Failed to load products (Status: ${response.statusCode})");
    }
  } catch (e) {
    print("Error in getProducts: $e");
    rethrow;
  }
}
