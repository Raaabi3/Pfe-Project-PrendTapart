import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/helpers/providers/Cart.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/models/cart_model.dart';
import 'package:menu_digitale_tablette/models/product_model/Options.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProduitScreen extends StatelessWidget {
  final Product product;
  ProduitScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Products prodProvider = Provider.of<Products>(context);
    final CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color(0xffFBF7FF),
        height: 10.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<Products>(
                builder: (context, provider, child) {
                  final totalPrice = prodProvider.calculateTotalPrice(product);
                  return Text(
                    totalPrice.toStringAsFixed(2) + "€",
                    style: headline,
                  );
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: prodProvider.isButtonEnabled(product)
                        ? () {
                            cartProvider.addItemToCart(
                                product, prodProvider.calculateTotalPrice(product), prodProvider.selectedOptionsList);
                          }
                        : null,
                    child: const Text('Add To Cart'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Image.network(
                product.img,
                fit: BoxFit.fill,
                height: 30.h,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      product.name,
                      style: headline,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.description,
                      style: body,
                    ),
                    const SizedBox(height: 15),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: product.groups!.length,
                      itemBuilder: (BuildContext context, int groupIndex) {
                        final group = product.groups![groupIndex];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Quelle ${group.name} ?",
                              style: subhead.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Choisissez jusqu'à ${group.maximumChoose}",
                              style: body,
                            ),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  group.options!.length,
                                  (optionIndex) {
                                    final option = group.options![optionIndex];
                                    final isSelected = prodProvider.selectedOptionsList.any((element) => element[group] == option);
                                    return GestureDetector(
                                      onTap: () {
                                        prodProvider.selectedoption(isSelected, product, option, group);
                                      },
                                      behavior: HitTestBehavior.translucent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isSelected ? Colors.blue : Colors.grey,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                          color: isSelected ? Colors.blue.withOpacity(0.3) : null,
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                        margin: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              option.name,
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "${option.price}€",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
