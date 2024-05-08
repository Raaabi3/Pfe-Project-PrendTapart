import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';

class ProductsController {
  bool optionExists(List<Map<EstablishmentProductOptionGroup, EstablishmentProductOption>> selectedOptionsList, EstablishmentProductOptionGroup group, EstablishmentProductOption option) {
    return selectedOptionsList.any((item) => item[group] == option);
  }

  void selectedOption(List<Map<EstablishmentProductOptionGroup, EstablishmentProductOption>> selectedOptionsList, EstablishmentProductOption option, EstablishmentProductOptionGroup group) {
    final selectedOptionsCount = selectedOptionsList.where((element) => element.keys.contains(group)).length;

    if (optionExists(selectedOptionsList, group, option)) {
      selectedOptionsList.removeWhere((element) => element[group] == option);
    } else {
      if (selectedOptionsCount < group.maximumChoose) {
        selectedOptionsList.add({
          group: option,
        });
      } else {
        print('Maximum choose limit reached for this group!');
      }
    }
  }

  double calculateTotalPrice(product, selectedOptionsList) {
    double totalPrice = double.parse(product.establishmentProducts[0]['price']);
    for (final selectedOption in selectedOptionsList) {
      final option = selectedOption.values.first;
      if (option != null) {
        totalPrice += double.parse(option.price);
      }
    }
    return totalPrice;
  }
}
