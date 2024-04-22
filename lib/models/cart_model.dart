import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';

class Cart {
  final int productId;
  final String productName;
  final String img;
  double price;
  int quantity;
  List<Map<EstablishmentProductOptionGroup, EstablishmentProductOption>> selectedOptionsList =[];


  Cart({
    required this.productId,
    required this.productName,
    required this.img,
    required this.price,
    required this.quantity,
    required this.selectedOptionsList,
  });
}
