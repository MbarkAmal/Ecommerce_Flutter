class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final String description ;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    this.quantity = 1,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json['id'].toString()),
      name: json['name'],
      //  fix type (num → double)
      price: (json['price'] as num).toDouble(),
      description :json['description'],
      image: json['image'],
    );
  }
}