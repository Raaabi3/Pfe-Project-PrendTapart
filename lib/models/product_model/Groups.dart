import 'package:menu_digitale_tablette/models/product_model/Options.dart';

class EstablishmentProductOptionGroup {
  final int id ;
  final String name;
  final int maximumChoose;
  final String type;
  final int establishmentId;
  final int is_required;
  List<EstablishmentProductOption>? options;

  EstablishmentProductOptionGroup({
     this.id=0,
     this.name='',
     this.maximumChoose=0,
     this.type='',
     this.establishmentId=0,
     this.is_required=0,
    this.options,

  });

  factory EstablishmentProductOptionGroup.fromJson(Map<String, dynamic> json) {
    return EstablishmentProductOptionGroup(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      maximumChoose: json['maximun_choose'] ?? 0,
      type: json['type'] ?? '',
      establishmentId: json['establishment_id'] ?? 0,
      is_required:json['is_required'] ?? 0,
options: json['options'] != null
        ? List<EstablishmentProductOption>.from(json['options'].map((option) => EstablishmentProductOption.fromJson(option)))
        : [],    );
  }
}