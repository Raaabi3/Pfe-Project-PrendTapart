import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/models/cart_model.dart';
import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> _cartItems = [];
  List<Cart> get cartItems => List.from(_cartItems);
  double total = 0.0;

  void updatetotal(newtotal) {
    total = newtotal;
    ChangeNotifier();
  }

  void removeItemFromGroup(int cartIndex, EstablishmentProductOptionGroup group, EstablishmentProductOption option) {
  final cartItem = _cartItems[cartIndex];
  
  if (group.is_required==0 || (group.is_required==1 && cartItem.selectedOptionsList.where((item) => item.keys.first == group).length > 1)) {
    cartItem.selectedOptionsList.removeWhere((item) {
      final optionGroup = item.keys.first;
      final optionItem = item.values.first;
      return optionGroup == group && optionItem == option;
    });
    cartItem.price -= option.price;
    notifyListeners();
  } else {
    print("Cannot remove item because it's required");
  }
}


  void addItemToCart(product, totalprice, List<Map<EstablishmentProductOptionGroup, EstablishmentProductOption>> selectedoptions) {
    Cart cartItem = Cart(
      productId: product.id,
      productName: product.name,
      quantity: 1,
      price: totalprice,
      img: product.establishmentProducts.isNotEmpty ? product.establishmentProducts[0]['img'] : '',
      selectedOptionsList: List<Map<EstablishmentProductOptionGroup, EstablishmentProductOption>>.from(selectedoptions),
    );
    _cartItems.add(cartItem);
    notifyListeners();
    printSelectedOptions(cartItem.selectedOptionsList);
  }

  void printSelectedOptions(selectedoptions) {
    print('Selected Options:');
    for (final option in selectedoptions) {
      final group = option.keys.first;
      final optionItem = option.values.first;
      if (group != null && optionItem != null) {
        print('Group: ${group.name}, Option: ${optionItem.name}');
      }
    }
  }

  void removeItemFromCart(index) {
    _cartItems.remove(_cartItems[index]);
    notifyListeners();
  }

  void updateItemQuantity(int productId, int newQuantity) {
    final index = _cartItems.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  double getTotalPrice() {
    return _cartItems.fold(0, (total, item) => total + (item.price * item.quantity));
  }

  void incrementQuantity(int index) {
    cartItems[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
