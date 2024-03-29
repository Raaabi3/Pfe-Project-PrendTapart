class Category {
  final int id;
  final int digiral_menu_formules_id;
  final String name;
  final int order;
  final int is_displayed;
  final DateTime? created_at;
  final DateTime? updated_at;

  Category({
    required this.id,
    required this.digiral_menu_formules_id,
    required this.name,
    required this.order,
    required this.is_displayed,
    required this.created_at,
    required this.updated_at,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      digiral_menu_formules_id: json['digiral_menu_formules_id'] ?? 0,
      name: json['name'] ?? '',
      order: json['order'] ?? 0,
      is_displayed: json['is_displayed'] ?? 0,
      created_at: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updated_at: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}
