class ProductExtra {
  final int id;
  final int establishmentId;
  final String name;
  final String image;
  final double price;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductExtra({
    required this.id,
    required this.establishmentId,
    required this.name,
    required this.image,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductExtra.fromJson(Map<String, dynamic> json) {
    return ProductExtra(
      id: json['id'] ?? 0,
      establishmentId: json['establishment_id']?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] != null ? double.parse(json['price'].toString()) : 0.0,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}
