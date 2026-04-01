class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  // ✅ correct name
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json['id'].toString()),
      name: json['name'],
      // ✅ fix type (num → double)
      price: (json['price'] as num).toDouble(),
      image: json['image'],
    );
  }
}