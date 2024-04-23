import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';

class Product {
  final int id;
  final String name;
  final List<Map<String, dynamic>> establishmentProducts; 
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? establishmentId;
  final int? productId;
  final String unit;
  final double priceByUnit;
  final String location;
  final int stockQuantity;
  final DateTime? dlc;
  final String ref;
  final String img;
  final String imgcover;
  final bool isRec;
  final bool isIng;
  final bool showHome;
  final String description;
  final bool autoUpgradeShoppingList;
  final int minimumQuantityToOrder;
  final int maximumQuantityToOrder;
  final int promotionId;
  final int digitalMenuRayonId;
  final double poids;
  final int establishmentTvaId;
  final int recetteId;
  final int establishmentProductRecId;
  final int qteForOneRec;
  List<EstablishmentProductOptionGroup>? groups ;

  Product({
     this.id =0,
     this.name ='',
     required this.establishmentProducts,
     this.createdAt,
     this.updatedAt,
     this.establishmentId,
     this.productId,
     this.unit ='',
     this.priceByUnit =0,
     this.location='',
     this.stockQuantity=0,
     this.dlc,
     this.ref='',
     this.img='',
     this.imgcover='',
     this.isRec=false,
     this.isIng=false,
     this.showHome=false,
     this.description='',
     this.autoUpgradeShoppingList=false,
     this.minimumQuantityToOrder= 0,
     this.maximumQuantityToOrder= 0,
     this.promotionId= 0,
     this.digitalMenuRayonId= 0,
     this.poids= 0,
     this.establishmentTvaId= 0,
     this.recetteId= 0,
     this.establishmentProductRecId= 0,
     this.qteForOneRec = 0,
     this.groups,
  });

factory Product.fromJson(Map<String, dynamic> json) { 
  return Product(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? ''),
    updatedAt: DateTime.parse(json['updated_at'] ?? ''),
    establishmentId: json['establishment_id'] as int?,
    productId: json['product_id'] as int?,
    unit: json['unit'] ?? '',
    location: json['location'] ?? '',
    stockQuantity: json['establishment_products']?.isNotEmpty == true ? int.tryParse(json['establishment_products'][0]['stock_quantity'].toString()) ?? 0 : 0,
    dlc: json['dlc'] != null ? DateTime.parse(json['dlc'] ?? '') : DateTime.now(),
    ref: json['ref'] ?? '',
    img: json['img'] ?? '',
    imgcover: json['img_cover'] ?? '',
    isRec: json['is_rec'] == 1,
    isIng: json['is_ing'] == 1,
    showHome: json['show_home'] == 1,
    description: json['desc'] ?? '',
    autoUpgradeShoppingList: json['auto_upgrade_shopping_list'] == 1,
    minimumQuantityToOrder: json['minimum_quantity_to_order'] ?? 0,
    maximumQuantityToOrder: json['maximum_quantity_to_order'] ?? 0,
    promotionId: json['promotion_id'] ?? 0,
    digitalMenuRayonId: json['digital_menu_rayon_id'] ?? 0,
    poids: json['poids'] != null ? double.tryParse(json['poids'].toString()) ?? 0.0 : 0.0,
    establishmentTvaId: json['establishment_tva_id'] ?? 0,
    recetteId: json['recette_id'] ?? 0,
    establishmentProductRecId: json['establishment_product_rec_id'] ?? 0,
    qteForOneRec: json['qte_for_one_rec'] ?? 0,
    establishmentProducts: List<Map<String, dynamic>>.from(json['establishment_products'] ?? []),
    priceByUnit: json['establishment_products']?.isNotEmpty == true ? double.tryParse(json['establishment_products'][0]['price_by_unit'].toString()) ?? 0.0 : 0.0,
    groups: json['establishment_products']?.isNotEmpty == true ? List<EstablishmentProductOptionGroup>.from(json['establishment_products'][0]['establishment_product_option_groups']?.map((group) => EstablishmentProductOptionGroup.fromJson(group)) ?? []) : [],
  );
}


}
