import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/models/cart_model.dart';
import 'package:menu_digitale_tablette/models/product_model/Groups.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> _cartItems = [];
  List<Cart> get cartItems => List.from(_cartItems);
  double total=0.0;
  List<Map<String, dynamic>> selectedOptionsList = [];


void updatetotal(newtotal){
total = newtotal;
ChangeNotifier();
}

void removeItemFromGroup(int cartIndex, EstablishmentProductOptionGroup group, EstablishmentProductOption option) {
  final cartItem = _cartItems[cartIndex];
  cartItem.selectedOptionsList.removeWhere((item) {
    final optionGroup = item['group'] as EstablishmentProductOptionGroup?;
    final optionItem = item['option'] as EstablishmentProductOption?;
    return optionGroup == group && optionItem == option;
  });
  cartItem.price = cartItem.price-option.price;

  notifyListeners();
}



void addItemToCart(product, totalprice, List<Map<String, dynamic>> selectedoptions) {
  Cart cartItem = Cart(
    productId: product.id,
    productName: product.name,
    quantity: 1,
    price: totalprice,
    img: product.img,
    selectedOptionsList: List<Map<String, dynamic>>.from(selectedoptions),
  );
  _cartItems.add(cartItem);
  notifyListeners();
  printSelectedOptions(cartItem.selectedOptionsList);
}


  void printSelectedOptions(selectedoptions) {
  print('Selected Options:');
  for (final option in selectedoptions) {
    final group = option['group'] as EstablishmentProductOptionGroup?;
    final optionItem = option['option'] as EstablishmentProductOption?;
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
    if (cartItems[index].quantity >1 ) {
      cartItems[index].quantity--;
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
