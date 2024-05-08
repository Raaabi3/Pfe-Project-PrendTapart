class EstablishmentProductOption {
  final int id;
  final String name;
  final String price;
  final int establishmentProductOptionsGroupsId;

  EstablishmentProductOption({
    required this.id,
    required this.name,
    required this.price,
    required this.establishmentProductOptionsGroupsId,
  });

  factory EstablishmentProductOption.fromJson(Map<String, dynamic> json) {
    return EstablishmentProductOption(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] != null ? json['price'].toString() : '',
      establishmentProductOptionsGroupsId: json['establishment_product_options_groups_id'] ?? 0,
    );
  }
}