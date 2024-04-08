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

    return Scaffold(
      body: Consumer<Products>(
        builder: (context, prodProvider, _) {
          final HomeLayoutController homeLayout =
              Provider.of<HomeLayoutController>(context);
          final CartProvider _cartprovider = Provider.of<CartProvider>(context);

          _scrollController.addListener(() {
            if (_scrollController.position.pixels ==
                    _scrollController.position.maxScrollExtent &&
                prodProvider.currentPage <= prodProvider.lastpage) {
              prodProvider.fetchProductsAndCategorize(
                  prodProvider.selectedCategory!.id);
            }
          });

          return Scaffold(
            bottomNavigationBar: Container(
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
                        const SizedBox(
                          height: 5,
                        ),
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
                                _cartprovider.cartItems.length.toString() +
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
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            _cartprovider.cartItems.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Image.network(
                                    _cartprovider.cartItems[index]?.img ?? '',
                                    fit: BoxFit.fill,
                                    height: 60,
                                    width: 50,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _cartprovider
                                            .cartItems[index].productName,
                                        style: body,
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        _cartprovider.cartItems[index].price
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
            ),
            body: Column(
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
                      const SizedBox(
                        width: 10,
                      ),
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
                      const SizedBox(
                        width: 10,
                      ),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                                        prodProvider.fetchProductsAndCategorize(
                                        prodProvider.selectedCategory!.id);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            prodProvider.categories[index].name,
                                            style: subhead.copyWith(
                                              fontWeight:
                                                  value.currentFoodTypeIndex ==
                                                          index
                                                      ? null
                                                      : FontWeight.w400,
                                            ),
                                            
                                          ),
                                          const SizedBox(
                                        width: 20,
                                      ),
                                          
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
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
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification scrollInfo) {
                              if (scrollInfo is ScrollEndNotification &&
                                  scrollInfo.metrics.extentAfter == 0 &&
                                  prodProvider.currentPage <=
                                      prodProvider.lastpage) {
                                prodProvider.fetchProductsAndCategorize(
                                    prodProvider.selectedCategory!.id);
                                    print("should fetch this cat :"+prodProvider.selectedCategory!.id.toString());
                              }
                              return true;
                            },
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 400,
                                crossAxisSpacing: 20,
                                mainAxisExtent: 500,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: prodProvider.selectedCategory
                                      ?.categoryProduct.length ??
                                  0,
                              itemBuilder: (BuildContext ctx, index) {
                                final categoryProduct = prodProvider
                                    .selectedCategory?.categoryProduct;
                                final product = categoryProduct?[index].product;

                                if (product != null && product.isNotEmpty) {
                                  // Print the ID of each product
                                  for (var prod in product) {
                                    print("Product ID: ${prod.id}");
                                  }

                                  return GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      var selectedProduct = product[
                                          0]; // Assuming there's only one product per category product
                                      var cartItem = Cart(
                                        productId: selectedProduct.id,
                                        productName: selectedProduct.name,
                                        img: selectedProduct.img,
                                        price: selectedProduct.priceByUnit,
                                        quantity: 1,
                                      );
                                      _cartprovider.addItemToCart(cartItem);
                                      SideSheet.left(
                                        body: ProduitScreen(
                                            product: selectedProduct),
                                        context: context,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ProductCard(
                                          product: product[
                                              0]), // Displaying the first product
                                    ),
                                  );
                                } else {
                                  return Container(); // Return a placeholder or loading widget
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
