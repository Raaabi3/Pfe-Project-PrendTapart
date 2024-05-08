import 'package:menu_digitale_tablette/models/cart_model.dart';
import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';

class CommandesController {
   Map<String, dynamic> buildBodyDataFromCart(double total, List<Cart> carts,optionsnames) {
  List<Map<String, dynamic>> products = [];

  for (Cart cartItem in carts) {
    Map<String, dynamic> productData = {
      "product_id": cartItem.product.id,
      "quantity": cartItem.quantity,
      "establishment_product_id": cartItem.product.establishmentProducts.isNotEmpty
          ? cartItem.product.establishmentProducts[0]['id']
          : null,
      "product_price": cartItem.price ,
      "options": getOptions(cartItem.selectedOptionsList,optionsnames),
    };

    products.add(productData);
  }

  return {
    "total": total,
    "products": products,
  };
}

  List<Map<String, dynamic>> getOptions(
  List<Map<EstablishmentProductOptionGroup, EstablishmentProductOption>> selectedOptionsList,optionsnames) {
  List<Map<String, dynamic>> options = [];
  for (var optionMap in selectedOptionsList) {
    EstablishmentProductOptionGroup group = optionMap.keys.first;
    EstablishmentProductOption option = optionMap.values.first;
    double optionPrice = double.parse(option.price); // Parse option price as double

    options.add({
      "group": group.id ,
      "option": option.id,
      "option_price": optionPrice,
    });
    optionsnames.add({
      "group": group.name ,
      "option": option.name,
      "option_price": option.price,
    });
  }

  return options;
}



}
