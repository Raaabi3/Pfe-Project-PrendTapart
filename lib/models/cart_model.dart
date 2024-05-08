import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';

class Cart {
  final Product product;
  double price ;
  String img;
  int quantity;
  List<Map<EstablishmentProductOptionGroup, EstablishmentProductOption>> selectedOptionsList =[];


  Cart({
    required this.img,
    required this.price,
    required this.product,
    required this.quantity,
    required this.selectedOptionsList,
  });
}
