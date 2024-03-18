import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/controllers/home_layout_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/products.dart';
import 'package:menu_digitale_tablette/views/pages/panier/panier_screen.dart';
import 'package:menu_digitale_tablette/views/pages/parametres/parametre_screen.dart';
import 'package:menu_digitale_tablette/views/pages/produit/produit_screen.dart';
import 'package:menu_digitale_tablette/views/widgets/product/product_card.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_sheet/side_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

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
                          width: MediaQuery.sizeOf(context).width * 0.5);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffF4F4F4)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: Text(
                            "4 produits",
                            style: subhead.copyWith(
                                color: const Color(0xff616161)),
                          )),
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
                  children: [
                    ...List.generate(
                        3,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://d2j6dbq0eux0bg.cloudfront.net/images/51235197/2146084191.jpg",
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
                                        "Tacos au polet",
                                        style: body,
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "12,99€",
                                        style: subhead.copyWith(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                  ],
                ),
              ))
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
                        body: const ParametreScreen(), context: context);
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 140,
                              crossAxisSpacing: 50,
                              mainAxisExtent: 50,
                              mainAxisSpacing: 10),
                      itemCount: 8,
                      itemBuilder: (BuildContext ctx, index) {
                        return Consumer<HomeLayoutController>(
                            builder: (context, value, child) => GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    value.switchFoodTypeIndex(index);
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
                                            "Petits kiff",
                                            style: subhead.copyWith(
                                                fontWeight:
                                                    value.currentFoodTypeIndex ==
                                                            index
                                                        ? null
                                                        : FontWeight.w400),
                                          ),
                                          const Text("  🥰")
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
                                              color: pinkColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffFFECE6)),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Center(
                          child: Text(
                        "Découvrire notre Petits Kiff",
                        style: headline.copyWith(color: pinkColor),
                      )),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.85,
                          crossAxisCount: 3,
                        ),
                        itemCount: 8,
                        itemBuilder: (BuildContext ctx, index) {
                          return Consumer<HomeLayoutController>(
                              builder: (context, value, child) =>
                                  GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        SideSheet.left(
                                            body: ProduitScreen(),
                                            context: context);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: ProductCard(),
                                      )));
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
