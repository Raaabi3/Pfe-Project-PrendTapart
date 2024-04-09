import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/controllers/home_layout_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/Cart.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/models/cart_model/cart_model.dart';
import 'package:menu_digitale_tablette/views/pages/panier/panier_screen.dart';
import 'package:menu_digitale_tablette/views/pages/parametres/parametre_screen.dart';
import 'package:menu_digitale_tablette/views/pages/produit/produit_screen.dart';
import 'package:menu_digitale_tablette/views/widgets/product/product_card.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_sheet/side_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    bool isLoading = false; 

    return Scaffold(
      bottomNavigationBar: Consumer<Products>(
        builder: (context, prodProvider, _) {
          final CartProvider _cartprovider = context.read<CartProvider>();
          _scrollController.addListener(() {
            if (_scrollController.position.pixels ==
                    _scrollController.position.maxScrollExtent &&
                !isLoading) {
              isLoading = true; 
              prodProvider.fetchproductbycategory().then((_) {
                isLoading = false; 
              });
              print("Scrolled to bottom");
            }
          });

          return Consumer<CartProvider>(
  builder: (context, cartProvider, _) {
              return Container(
                height: 12.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Votre panier : ",
                            style: subhead,
                          ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              SideSheet.right(
                                body: const PanierScreen(),
                                context: context,
                                width: MediaQuery.of(context).size.width * 0.5,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffF4F4F4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                child: Text(
                                  cartProvider.cartItems.length.toString() +
                                      " Products",
                                  style: subhead.copyWith(
                                    color: const Color(0xff616161),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              cartProvider.cartItems.length,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    Image.network(
                                      cartProvider.cartItems[index]?.img ?? '',
                                      fit: BoxFit.fill,
                                      height: 60,
                                      width: 50,
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          cartProvider
                                              .cartItems[index].productName,
                                          style: body,
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          cartProvider.cartItems[index].price
                                              .toString(),
                                          style: subhead.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          );
        },
      ),
      body: Consumer<Products>(
        builder: (context, prodProvider, _) {
          final HomeLayoutController homeLayout =
              Provider.of<HomeLayoutController>(context);

          return Column(
            children: [
              Container(
                height: 10.h,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(color: Color(0xff3A3244)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/cocuisinage_logo.png",
                      height: 50,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Cocuisinage",
                      style: subhead.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 40.w,
                      child: AutoSizeText(
                        "Que souhaitez-vous commander ?",
                        maxLines: 1,
                        style: headline.copyWith(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        context.read<HomeLayoutController>().switchScreen(2);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: pinkColor,
                        child: Image.asset(
                          "assets/icons/table.png",
                          height: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        SideSheet.right(
                          body: const ParametreScreen(),
                          context: context,
                        );
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: pinkColor,
                        child: Image.asset(
                          "assets/icons/settings.png",
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            prodProvider.categories.length,
                            (index) => Consumer<HomeLayoutController>(
                              builder: (context, value, child) =>
                                  GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  value.switchFoodTypeIndex(index);
                                  prodProvider.getselectedcat(
                                      prodProvider.categories[index]);

                                  if (prodProvider
                                              .selectedCategory!.currentPage ==
                                          1 &&
                                      prodProvider
                                          .selectedCategory!.product.isEmpty) {
                                    prodProvider.fetchproductbycategory();
                                  }

                                  print("Clicked on category");
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      prodProvider.categories[index].name,
                                      style: subhead.copyWith(
                                        fontWeight:
                                            value.currentFoodTypeIndex == index
                                                ? null
                                                : FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Visibility(
                                      visible:
                                          value.currentFoodTypeIndex == index,
                                      child: Container(
                                        height: 4,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: pinkColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffFFECE6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Center(
                            child: Text(
                              "Découvrire notre Petits Kiff",
                              style: headline.copyWith(color: pinkColor),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          controller:
                              _scrollController, 
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 400,
                            crossAxisSpacing: 20,
                            mainAxisExtent: 500,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: prodProvider.selectedCategory!.product !=
                                  null
                              ? prodProvider.selectedCategory!.product.length
                              : 0,
                          itemBuilder: (BuildContext ctx, index) {
                            final product =
                                prodProvider.selectedCategory!.product;
                            return GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                var selectedProduct = product[index];
                                var cartItem = Cart(
                                  productId: selectedProduct.id,
                                  productName: selectedProduct.name,
                                  img: selectedProduct.img,
                                  price: selectedProduct.priceByUnit,
                                  quantity: 1,
                                );
                                context
                                    .read<CartProvider>()
                                    .addItemToCart(cartItem);
                                SideSheet.left(
                                  body: ProduitScreen(product: selectedProduct),
                                  context: context,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ProductCard(
                                  product: product![index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
