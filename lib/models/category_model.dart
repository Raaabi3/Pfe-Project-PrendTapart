import 'package:menu_digitale_tablette/models/product_model/Product.dart';

class Category {
  final int id;
  final String name;
  final int order_show;
  final int isDisplayed;
  final String image;
  final int establishment_id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  List<Product> product;

  Category({
    required this.id,
    required this.name,
    required this.order_show,
    required this.isDisplayed,
    required this.image,
    required this.establishment_id,
    required this.createdAt,
    required this.updatedAt,
  }) : product = [];

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      order_show: json['order_show'] ?? 0,
      isDisplayed: json['is_displayed'] ?? 0,
      image:json['image'] ?? '',
      establishment_id: json['establishment_id'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
}
