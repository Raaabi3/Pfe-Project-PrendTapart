class Product {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int establishmentId;
  final int productId;
  final String unit;
  final double priceByUnit;
  final String location;
  final int stockQuantity;
  final DateTime dlc;
  final String ref;
  final String img;
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

  Product({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.establishmentId,
    required this.productId,
    required this.unit,
    required this.priceByUnit,
    required this.location,
    required this.stockQuantity,
    required this.dlc,
    required this.ref,
    required this.img,
    required this.isRec,
    required this.isIng,
    required this.showHome,
    required this.description,
    required this.autoUpgradeShoppingList,
    required this.minimumQuantityToOrder,
    required this.maximumQuantityToOrder,
    required this.promotionId,
    required this.digitalMenuRayonId,
    required this.poids,
    required this.establishmentTvaId,
    required this.recetteId,
    required this.establishmentProductRecId,
    required this.qteForOneRec,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ??0,
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      updatedAt: DateTime.parse(json['updated_at'] ?? ''),
      establishmentId: json['establishment_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      unit: json['unit'] ?? '',
      priceByUnit: json['price_by_unit'] != null ? double.parse(json['price_by_unit'].toString()) : 0.0,
      location: json['location'] ?? '',
      stockQuantity: json['stock_quantity'] != null ? int.parse(json['stock_quantity'].toString()) : 0,
      dlc: json['dlc'] != null ? DateTime.parse(json['dlc'] ?? '') : DateTime.now(),
      ref: json['ref'] ?? '',
      img: json['img'] ?? '',
      isRec: json['is_rec'] != null ? json['is_rec'] == 1 : false,
      isIng: json['is_ing'] != null ? json['is_ing'] == 1 : false,
      showHome: json['show_home'] != null ? json['show_home'] == 1 : false,
      description: json['description'] ?? '',
      autoUpgradeShoppingList: json['auto_upgrade_shopping_list'] != null ? json['auto_upgrade_shopping_list'] == 1 : false,
      minimumQuantityToOrder: json['minimum_quantity_to_order'] ?? 0,
      maximumQuantityToOrder: json['maximum_quantity_to_order'] ?? 0,
      promotionId: json['promotion_id'] ?? 0,
      digitalMenuRayonId: json['digital_menu_rayon_id'] ?? 0,
      poids: json['poids'] != null ? double.parse(json['poids'].toString()) : 0.0,
      establishmentTvaId: json['establishment_tva_id'] ?? 0,
      recetteId: json['recette_id'] ?? 0,
      establishmentProductRecId: json['establishment_product_rec_id'] ?? 0,
      qteForOneRec: json['qte_for_one_rec'] ?? 0,
    );
  }
}