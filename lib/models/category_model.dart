import 'package:menu_digitale_tablette/models/product_model/Product.dart';

class Category {
  int currentPage = 1;
  int lastPage = 0;
  int total = 0;
  final int id;
  final int digitalMenuFormulesId;
  final String name;
  final int order;
  final int isDisplayed;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  List<Product> product;

  Category({
    required this.id,
    required this.digitalMenuFormulesId,
    required this.name,
    required this.order,
    required this.isDisplayed,
    required this.createdAt,
    required this.updatedAt,
  }) : product = []; 

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      digitalMenuFormulesId: json['digital_menu_formules_id'] ?? 0,
      name: json['name'] ?? '', 
      order: json['order'] ?? 0,
      isDisplayed: json['is_displayed'] ?? 0,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}

