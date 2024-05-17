import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_digitale_tablette/controllers/home_layout_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/helpers/providers/Screens.dart';
import 'package:menu_digitale_tablette/views/pages/commande/commande_screen.dart';
import 'package:menu_digitale_tablette/views/pages/historique/commande_screen.dart';
import 'package:menu_digitale_tablette/views/pages/panier/panier_screen.dart';
import 'package:menu_digitale_tablette/views/pages/parametres/parametre_screen.dart';
import 'package:menu_digitale_tablette/views/pages/plan_de_table/plan_de_table_screen.dart';
import 'package:menu_digitale_tablette/views/widgets/product/product_search.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:menu_digitale_tablette/views/widgets/product/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> languages = [
  'English',
  'Spanish',
  'French',
  'German',
  'Chinese',
  'Japanese',
  'Korean',
  'Russian',
  'Arabic',
  'Hindi',
];
String? _selectedLanguage = 'English';

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _categoryScrollController;
  late ScrollController _productScrollController;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _categoryScrollController = ScrollController();
    _productScrollController = ScrollController();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _categoryScrollController.dispose();
    _productScrollController.dispose();
    super.dispose();
  }

  void onCategorySelected(int index) {
    _productScrollController.animateTo(
      index * MediaQuery.of(context).size.height / 2.7,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onCategoryScroll(int index) {
    Provider.of<HomeLayoutController>(context, listen: false)
        .switchFoodTypeIndex(index);
  }
  

  @override
  Widget build(BuildContext context) {
    final Products prodProvider = Provider.of<Products>(context);
    final ScreenController screenProvider =
        Provider.of<ScreenController>(context);

    void updateSearchQuery(String query) {
      screenProvider.togglesearchscreen(query);
    }
    

    return Scaffold(
      floatingActionButton: screenProvider.hideTaskbar
          ? null
          : !screenProvider.showpaniericon
              ? Container(
                  height: 5.8333.h,
                  width: 9.23611111111111.w,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Provider.of<HomeLayoutController>(context,
                                listen: false)
                            .resetSelectedCategoryIndex(); // Reset selected category index
                        screenProvider.idlepanier();
                        context.read<ScreenController>().toggleScreen();
                      },
                      label: Text(
                        'Panier',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w200),
                      ),
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 33,
                      ),
                      backgroundColor: Color.fromRGBO(186, 27, 41, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Row(
        children: [
          Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  width: 19.6.w,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new ExactAssetImage(
                          'assets/images/menusidebackground.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: new Container(
                      decoration: new BoxDecoration(
                          color:
                              Color.fromARGB(255, 53, 51, 51).withOpacity(0.5)),
                    ),
                  ),
                ),
              ),
              Container(
                width: 20.w,
                child: Consumer<Products>(
                  builder: (context, prodProvider, _) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 4.7917.h,
                        ),
                        Image.asset(
                          "assets/images/foodeatupservice.png",
                          height: 10.h,
                          width: 19.w,
                        ),
                        SizedBox(height: 12.1875.h),
                        prodProvider.categories.length > 0
                            ? Expanded(
                                child: ListView.builder(
                                  controller: _categoryScrollController,
                                  itemCount: prodProvider.categories.length,
                                  itemBuilder: (context, index) {
                                    return Consumer<HomeLayoutController>(
                                      builder: (context, value, child) =>
                                          GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          prodProvider.getselectedcat(
                                              prodProvider.categories[index]);
                                          onCategorySelected(index);
                                        },
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(left: 2.1528.w),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      value.currentFoodTypeIndex ==
                                                              index
                                                          ? Colors.white
                                                          : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        value.currentFoodTypeIndex ==
                                                                index
                                                            ? 50
                                                            : 0),
                                                    bottomLeft: Radius.circular(
                                                        value.currentFoodTypeIndex ==
                                                                index
                                                            ? 50
                                                            : 0),
                                                  ),
                                                  border: Border(
                                                    left: BorderSide(
                                                        color:
                                                            value.currentFoodTypeIndex ==
                                                                    index
                                                                ? Colors.white
                                                                : Colors
                                                                    .transparent,
                                                        width:
                                                            value.currentFoodTypeIndex ==
                                                                    index
                                                                ? 5.w
                                                                : 3.w),
                                                  ),
                                                ),
                                                child: Container(
                                                  height: 7.0833.h,
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        0,
                                                        1.875.h,
                                                        value.currentFoodTypeIndex ==
                                                                index
                                                            ? 2.180555555555555
                                                                .w
                                                            : 4.180555555555555
                                                                .w,
                                                        1.875.h),
                                                    child: FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Text(
                                                        prodProvider
                                                            .categories[index]
                                                            .name,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color:
                                                              value.currentFoodTypeIndex ==
                                                                      index
                                                                  ? Color
                                                                      .fromRGBO(
                                                                          186,
                                                                          27,
                                                                          41,
                                                                          1)
                                                                  : Colors
                                                                      .white,
                                                          fontWeight:
                                                              value.currentFoodTypeIndex ==
                                                                      index
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .w400,
                                                          fontSize: 24,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5.2083.h),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(child: Spacer()),
                        SizedBox(
                          height: 10.625.h,
                        ),
                        Container(
                          width: 17.w,
                          padding: EdgeInsets.fromLTRB(0.03.dp, 0, 0, 2.h),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 0.908333333333333.h),
                                child: Container(
                                  height: 4.5833.h,
                                  width: 3.0556.w,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: InkWell(
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.transparent,
                                          child: Icon(
                                            Icons.info_rounded,
                                            color: Colors.white,
                                            size: 35,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 5.2083.h,
                                width: 3.4722.w,
                                child: InkWell(
                                  onTap: () {
                                    SideSheet.right(
                                      body: const ParametreScreen(),
                                      context: context,
                                    );
                                  },
                                  child: Center(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Container(
                                          width: 2.1528.w,
                                          height: 3.4375.h,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Icon(
                                              Icons.settings,
                                              color: Color.fromRGBO(
                                                  186, 27, 41, 1),
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      4.5833.w, 3.1771.h, 4.5833.w, 3.0208.h),
                  child: screenProvider.hideTaskbar
                      ? null
                      : Row(
                          children: [
                            Flexible(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 27.9167.w,
                                  height: 5.2083.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.2.w,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: GestureDetector(
                                    child: TextField(
                                      controller: _searchController,
                                      onChanged: (query) {
                                        screenProvider
                                            .togglesearchscreen(query);
                                        Provider.of<HomeLayoutController>(
                                                context,
                                                listen: false)
                                            .resetSelectedCategoryIndex();
                                      },
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.poppins(
                                            fontSize: 0.095.dp,
                                            fontWeight: FontWeight.w400),
                                        border: InputBorder.none,
                                        icon: Padding(
                                          padding:
                                              EdgeInsets.only(left: 0.09.dp),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.search,
                                                size: 0.115.dp,
                                                color: Colors.black,
                                              ),
                                              SizedBox(
                                                width: 1.25.w,
                                              ),
                                              Container(
                                                height: 2.5.h,
                                                width: 7.5.w,
                                                child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Text(
                                                      "Entrez un plat",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              152,
                                                              152,
                                                              152,
                                                              1)),
                                                    )),
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
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 4.5.h,
                                      width: 3.194444444444444.w,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                          'TABLE',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              height: 2.4,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 2.2222222222222223.w,
                                      height: 5.h,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                          '10',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 32,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2.6389.w),
                                    Container(
                                      height: 3.h,
                                      width: 4.791666666666667.w,
                                      child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text(
                                              _selectedLanguage.toString())),
                                    ),
                                    Container(
                                      height: 1.h,
                                      width: 3.w,
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          // Adjust padding as needed
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                8), // Adjust border radius as needed
                                            borderSide: BorderSide
                                                .none, // Remove the border line
                                          ),
                                          filled: true,
                                          fillColor: Colors
                                              .grey[200], // Background color
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _selectedLanguage = newValue;
                                          });
                                        },
                                        items: languages
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(value,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                  textAlign: TextAlign.center),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                Expanded(
                  child: Consumer<ScreenController>(
                    builder: (context, controller, _) {
                      if (!controller.loggedin) {
                        return PlanDeTableScreen();
                      } else if (controller.isCommandeScreenVisible == true) {
                        return CommandesScreen();
                      } else if (screenProvider.isSearchScreenVisible) {
                        return SearchScreen(
                          allProducts: prodProvider
                              .getAllProducts(_searchController.text),
                          filterProducts: updateSearchQuery,
                        );
                      } else if (controller.showPanierScreen) {
                        return PanierScreen();
                      } else {
                        if (mounted) {
                          return ProductList(
                            scrollController: _productScrollController,
                            onCategorySelected: onCategorySelected,
                            onCategoryScroll: onCategoryScroll,
                            onScrollDirectionChanged: (isScrollingDown) {
                              controller.hidetaskbar(isScrollingDown);
                              print(isScrollingDown);
                            },
                          );
                        } else {
                          // Return a placeholder widget or null when ProductList is not shown
                          return SizedBox.shrink();
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
