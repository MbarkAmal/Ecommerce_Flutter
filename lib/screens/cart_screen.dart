import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/product_card.dart';
import 'package:provider/provider.dart';
import '../providers/cart_providers.dart' ;
import 'checkout_screen.dart';
class CartScreen extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
   var cart = context.watch<CartProviders>().cart; // list of prosucts 
  final cartProvider = context.watch<CartProviders>(); //  all function


    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body:cart.isEmpty
      ?Center(child: Text("Cart is empty"),)
       :ListView.builder(
    itemCount: cart.length,
        itemBuilder: (context, index) {
          var ProductCard =cart[index];

          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white ,
              borderRadius:  BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5, color: Colors.grey.shade300,
                )
              ],
            ),
          child: Row(
            children: [
              // image 
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image.network(
                  ProductCard.image,
                  width: 80, 
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10,),

              //product Info 
              Expanded(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ProductCard.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),

                    ),
                    SizedBox(height: 5,),
                    Text("\$${ProductCard.price}"),
                  ],

                ) ,
                ),

// ➖ button
    IconButton(
      icon: Icon(Icons.remove),
      onPressed: () {
        context.read<CartProviders>().decreaseQty(index);
      },
    ),
            Text("${ProductCard.quantity}"),
                          // + button

             IconButton(
              icon: Icon(Icons.add),
              onPressed: () => {
                context.read<CartProviders>().increaseQty(index)

              },
            ),
                //delete button
                IconButton(
                  onPressed: () {
                    // read call function remove without rebuild  ui 
                    context.read<CartProviders>().remove(index);
                  },
                 icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  )),
          
          
            ],
            
           

          ),
         
          );

          
        },
      ),

   bottomNavigationBar: Container(
  padding: EdgeInsets.all(15),
  color: Colors.white,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "Total: \$${cartProvider.totalPrice}",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),

      SizedBox(height: 10),

      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CheckoutScreen(),
              ),
            );
          },
          child: Text  (
            "Checkout",
            style: TextStyle(
              color: Colors.white),
          ),
         
        ),
      ),
    ],
  ),
),
    );
  }
}
