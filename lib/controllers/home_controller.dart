

import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:provider/provider.dart';

class HomeController {
  
void scrollToCategory(context, _scrollController, index) {
  if (_scrollController.hasClients) {
    final RenderBox renderBox =
        context.findRenderObject() as RenderBox;
    final double offset = renderBox.localToGlobal(Offset.zero).dy;
    double totalHeight = 0;
    for (int i = 0; i < index; i++) {
      totalHeight += 30; 
      totalHeight += Provider.of<Products>(context, listen: false)
          .categories[i]
          .product
          .length *
          100; 
    }
    _scrollController.animateTo(
      totalHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
  
}
