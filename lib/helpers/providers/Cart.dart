import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/models/cart_model/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> _cartItems = [];
  List<Cart> get cartItems => List.from(_cartItems);
  double total=0.0;

void updatetotal(newtotal){
total = newtotal;
ChangeNotifier();
}

  void addItemToCart(Cart item) {
  bool itemExists = false;
  for (var product in cartItems) {
    if (product.productId == item.productId) {
      product.quantity++;
      itemExists = true;
      break;
    }
  }
  if (!itemExists) {
    _cartItems.add(item);
  }
  notifyListeners();
}


  void removeItemFromCart(int productId) {
    _cartItems.removeWhere((item) => item.productId == productId);
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
