class ProductSize {
  final int id;
  final int establishment_product_id;
  final String name;
  final String image;
  final double price;
  final DateTime? created_at;
  final DateTime? updated_at;

  ProductSize({
    required this.id,
    required this.establishment_product_id,
    required this.name,
    required this.image,
    required this.price,
    required this.created_at,
    required this.updated_at,
  });

  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return ProductSize(
      id: json['id'] ?? 0,
      establishment_product_id: json['establishment_product_id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] != null ? double.parse(json['price'].toString()) : 0.0,
      created_at: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updated_at: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}
