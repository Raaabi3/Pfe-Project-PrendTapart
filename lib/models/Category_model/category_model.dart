import 'package:menu_digitale_tablette/models/product_model/product_model.dart';

class Category {
  final int currentPage;
  final int lastPage;
  final int total;
  final int id;
  final int digitalMenuFormulesId;
  final String name;
  final int order;
  final int isDisplayed;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<CategoryProduct> categoryProduct;

  Category({
    this.lastPage =0,
    this.currentPage=0,
    this.total=0,
    required this.id,
    required this.digitalMenuFormulesId,
    required this.name,
    required this.order,
    required this.isDisplayed,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryProduct,
  });
factory Category.fromJson(Map<String, dynamic> json) {
  List<CategoryProduct> categoryProduct = [];
  if (json['digital_menu_formules_categorie_products'] != null &&
      json['digital_menu_formules_categorie_products'] is List) {
    categoryProduct = List<CategoryProduct>.from(json['digital_menu_formules_categorie_products'].map((productJson) => CategoryProduct.fromJson(productJson)));
  }

  return Category(
    currentPage: json['current_page'] != null ? int.tryParse(json['current_page'].toString()) ?? 0 : 0,
    lastPage: json['last_page'] != null ? int.tryParse(json['last_page'].toString()) ?? 0 : 0,
    total: json['total'] != null ? int.tryParse(json['total'].toString()) ?? 0 : 0,
    id: json['id'] ?? 0,
    digitalMenuFormulesId: json['digiral_menu_formules_id'] ?? 0,
    name: json['name'] ?? '',
    order: json['order'] ?? 0,
    isDisplayed: json['is_displayed'] ?? 0,
    createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    categoryProduct: categoryProduct,
  );
}



}

class CategoryProduct {
  final int id;
  final int digitalMenuFormulesCategorieId;
  final int establishmentProductId;
  final int order;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  late final List<Product>? product;

  CategoryProduct(
      {required this.id,
      required this.digitalMenuFormulesCategorieId,
      required this.establishmentProductId,
      required this.order,
      this.createdAt,
      this.updatedAt,
      this.product});

  factory CategoryProduct.fromJson(Map<String, dynamic> json) {
    return CategoryProduct(
        id: json['id'] ?? 0,
        digitalMenuFormulesCategorieId:
            json['digital_menu_formules_categorie_id'] ?? 0,
        establishmentProductId: json['establishment_product_id'] ?? 0,
        order: json['order'] ?? 0,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
        product: []);
  }
}
