import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/helpers/providers/Cart.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/models/cart_model.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProduitScreen extends StatefulWidget {
  final Product product;
  ProduitScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProduitScreenState createState() => _ProduitScreenState();
}

class _ProduitScreenState extends State<ProduitScreen> {
  List<List<int>> selectedOptions = [];

  @override
  void initState() {
    super.initState();
    selectedOptions =
        List.generate(widget.product.groups!.length, (index) => []);
  }

  bool isAddToCartDisabled() {
    for (var groupIndex = 0;
        groupIndex < widget.product.groups!.length;
        groupIndex++) {
      var group = widget.product.groups![groupIndex];
      if (group.is_required == 1 && selectedOptions[groupIndex].isEmpty) {
        return true;
      }
    }
    return false;
  }

  void addToCart(BuildContext context, double total) {
    final CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    Cart cartItem = Cart(
      productId: widget.product.id,
      productName: widget.product.name,
      quantity: 1,
      price: total,
      img: widget.product.img,
    );

    cartProvider.addItemToCart(cartItem);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Product added to cart'),
    ));
  }

  Widget build(BuildContext context) {
    final Products prodProvider = Provider.of<Products>(context);

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
                  return Text(
                    prodProvider.total.toStringAsFixed(2) + "€",
                    style: headline,
                  );
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: isAddToCartDisabled()
                        ? null
                        : () {
                            addToCart(context, prodProvider.total);
                          },
                    child: const Text('Add To cart'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.product.img,
              fit: BoxFit.fill,
              height: 30.h,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.product.name,
                    style: headline,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.product.description,
                    style: body,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  for (var groupIndex = 0;
                      groupIndex < widget.product.groups!.length;
                      groupIndex++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Quelle ${widget.product.groups![groupIndex].name} ?",
                          style: subhead.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Choisissez jusqu'à ${widget.product.groups![groupIndex].maximumChoose}",
                          style: body,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              widget
                                  .product.groups![groupIndex].options!.length,
                              (optionIndex) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Provider.of<Products>(context,
                                            listen: false)
                                        .updateSelectedOptions(
                                            groupIndex,
                                            optionIndex,
                                            selectedOptions[groupIndex],
                                            widget.product.groups!);
                                                                                prodProvider.getTotalPrice(widget.product, selectedOptions);

                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: selectedOptions[groupIndex]
                                              .contains(optionIndex)
                                          ? const Color(0xff3A3244)
                                          : null,
                                      border: Border.all(color: greyColor),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 8),
                                          Text(
                                            widget.product.groups![groupIndex]
                                                .options![optionIndex].name,
                                            style: body.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: selectedOptions[groupIndex]
                                                      .contains(optionIndex)
                                                  ? Colors.white
                                                  : null,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Container(
                                            color: greyColor,
                                            width: 1,
                                            height: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "${widget.product.groups![groupIndex].options![optionIndex].price}€",
                                            style: body.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: selectedOptions[groupIndex]
                                                      .contains(optionIndex)
                                                  ? Colors.white
                                                  : null,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
