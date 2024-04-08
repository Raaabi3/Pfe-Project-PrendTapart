class EstablishmentProduct {
  final int id;
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
  final int? promotionId;
  final int? digitalMenuRayonId;
  final double? poids;
  final int? establishmentTvaId;
  final int? recetteId;
  final int? establishmentProductRecId;
  final double? qteForOneRec;

  EstablishmentProduct({
    required this.id,
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

  factory EstablishmentProduct.fromJson(Map<String, dynamic> json) {
    return EstablishmentProduct(
      id: json['id'] ?? 0,
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      updatedAt: DateTime.parse(json['updated_at'] ?? ''),
      establishmentId: json['establishment_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      unit: json['unit'] ?? '',
      priceByUnit: json['price_by_unit'] ?? 0.0,
      location: json['location'] ?? '',
      stockQuantity: int.parse(json['stock_quantity'].toString()),
      dlc: DateTime.parse(json['dlc'] ?? ''),
      ref: json['ref'] ?? '',
      img: json['img'] ?? '',
      isRec: json['is_rec'] == 1,
      isIng: json['is_ing'] == 1,
      showHome: json['show_home'] == 1,
      description: json['description'] ?? '',
      autoUpgradeShoppingList: json['auto_upgrade_shopping_list'] == 1,
      minimumQuantityToOrder: json['minimum_quantity_to_order'] ?? 0,
      maximumQuantityToOrder: json['maximum_quantity_to_order'] ?? 0,
      promotionId: json['promotion_id'],
      digitalMenuRayonId: json['digital_menu_rayon_id'],
      poids: json['poids'],
      establishmentTvaId: json['establishment_tva_id'],
      recetteId: json['recette_id'],
      establishmentProductRecId: json['establishment_product_rec_id'],
      qteForOneRec: json['qte_for_one_rec'],
    );
  }
}
