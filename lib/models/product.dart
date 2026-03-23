
class Product {
  final String title ;
  final double price ;
  final String image ;
  int quantity ;


  Product({
    required this.title ,
    required this.price ,
    required this.image ,
    this.quantity =1 ,

  });
}
