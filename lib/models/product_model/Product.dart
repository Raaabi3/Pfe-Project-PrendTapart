import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final String code_bar;
  final String marque;
  final int product_tag_id;
  final DateTime? created_at;
  final DateTime? updated_at;
  final List<dynamic> establishmentProducts;

  List<EstablishmentProductOptionGroup>? groups;

  Product({
    this.id = 0,
    this.name = '',
    this.description = "",
    this.image = "",
    this.code_bar = "",
    this.marque = "",
    this.product_tag_id = 0,
    this.created_at,
    this.updated_at,
    required this.establishmentProducts,
    this.groups,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    description: json['description'] ?? '',
    image: json['image'] ?? '',
    code_bar: json['code_bar'] ?? '',
    marque: json['marque'] ?? '',
    product_tag_id: json['product_tag_id'] != null ? json['product_tag_id'] as int : 0,
    created_at: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
    updated_at: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
establishmentProducts: json['establishment_products'] ?? [],
    groups: json['establishment_products']?.isNotEmpty == true
        ? List<EstablishmentProductOptionGroup>.from(
            json['establishment_products'][0]['establishment_product_option_groups']
                ?.map((group) => EstablishmentProductOptionGroup.fromJson(group)) ??
            [])
        : [],
  );
}


}
