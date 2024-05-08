import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';

class Commande {
  int commande_id;
  double total ;
  String status;
  DateTime? created_at;
  DateTime? updated_at;
  List<Product>? products;
  List<Map<String,Object>>? options;

  Commande({
    required this.commande_id,
    required this.total,
    required this.status,
    required this.created_at,
    required this.updated_at,
    this.products,
    this.options,
  });

  factory Commande.fromJson(Map<String, dynamic> json) {
    return Commande(
      commande_id:json['commande_id'] ?? 0,
      status: json['status'] ?? "",
      total: json['total'] ?? 0,
      created_at:  json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updated_at: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
  
}