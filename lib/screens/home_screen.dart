import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/bar.dart';
import '../services/api_service.dart'; 
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> { // data is stored here and can be chnaged by setState 
  late Future<List<Product>> _productsFuture; // fetching data from aoi call or json file and store it in this variable 

  @override
  void initState() {
    super.initState();
    _productsFuture = getProducts();
  }
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: 
        FutureBuilder<List<Product>>(
          future: _productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 40),
                    const SizedBox(height: 10),
                    Text('Error: ${snapshot.error}'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _productsFuture = getProducts();
                        });
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No products found'));
            }

            final products = snapshot.data!;
            final filteredProducts = products.where((product) {
               return product.name.toLowerCase().contains(searchQuery);
              }).toList();

           return Column(
            children: [
              SearchBarWidget(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                     });
                      },
                      ),

    //  Products Grid
    Expanded(
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            product: filteredProducts[index],
          );
        },
      ),
    ),
  ],
);
          },
        ),
      ),
    );
  }
}
