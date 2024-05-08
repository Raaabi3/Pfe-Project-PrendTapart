import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/controllers/home_layout_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/helpers/providers/Screens.dart';
import 'package:menu_digitale_tablette/views/pages/panier/panier_screen.dart';
import 'package:menu_digitale_tablette/views/pages/parametres/parametre_screen.dart';
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

int _selectedCategoryIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _categoryScrollController;
  late ScrollController _productScrollController;
  int _selectedCategoryIndex = 0;
  late TextEditingController _searchController;
  bool _hideTaskbar = false;

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
    setState(() {
      _selectedCategoryIndex = index;
    });
    _productScrollController.animateTo(
      index * MediaQuery.of(context).size.height / 1.90,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onCategoryScroll(int index) {
    print("scrolled to this :" + index.toString());

    setState(() {
      _selectedCategoryIndex = index; 
    });
    Provider.of<HomeLayoutController>(context, listen: false)
        .switchFoodTypeIndex(index);
  }


  @override
  Widget build(BuildContext context) {

    
    final Products prodProvider = Provider.of<Products>(context);
    final ScreenController screenProvider =
        Provider.of<ScreenController>(context);

  void updateSearchQuery(String query) {
  setState(() {
    screenProvider.togglesearchscreen(query);
  });
}

    return Scaffold(
      floatingActionButton: _hideTaskbar? null : !screenProvider.showpaniericon
          ? FloatingActionButton.extended(
              onPressed: () {
                screenProvider.idlepanier();
                context.read<ScreenController>().toggleScreen();
              },
              label: Text('Panier'),
              icon: Icon(Icons.shopping_cart_outlined),
              backgroundColor: Colors.red[800],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
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
                  width: 20.w,
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
                          color: Colors.grey.withOpacity(0.1)),
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Image.asset(
                            "assets/images/foodeatupservice.png",
                            height: 10.h,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: _categoryScrollController,
                            padding: EdgeInsets.symmetric(vertical: 100),
                            itemCount: prodProvider.categories.length,
                            itemBuilder: (context, index) {
                              return Consumer<HomeLayoutController>(
                                builder: (context, value, child) =>
                                    GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    value.switchFoodTypeIndex(index);
                                    prodProvider.getselectedcat(
                                        prodProvider.categories[index]);
                                    onCategorySelected(index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(height: 20),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: value.currentFoodTypeIndex ==
                                                    index
                                                ? Colors.white
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.only(
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
                                                        : Colors.transparent,
                                                width: 50,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            prodProvider.categories[index].name,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color:
                                                  value.currentFoodTypeIndex ==
                                                          index
                                                      ? Colors.pinkAccent
                                                      : Colors.white,
                                              fontWeight:
                                                  value.currentFoodTypeIndex ==
                                                          index
                                                      ? FontWeight.bold
                                                      : FontWeight.w500,
                                              fontFamily: 'Poppins',
                                              fontSize: 24,
                                              height: 2,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Visibility(
                                          visible: value.currentFoodTypeIndex ==
                                              index,
                                          child: Container(
                                            height: 4,
                                            width: 140,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.info_rounded,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                SideSheet.right(
                                  body: const ParametreScreen(),
                                  context: context,
                                );
                              },
                              child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.pink.shade700,
                                  )),
                            ),
                          ],
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
                  padding: const EdgeInsets.all(8.0),
                  child: _hideTaskbar?null : Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  controller: _searchController,
                                  onChanged: (query) {
                                    screenProvider.togglesearchscreen(query);
                                                                       },
                                  decoration: InputDecoration(
                                    hintText: 'Entez un plat',
                                    border: InputBorder.none,
                                    icon: Icon(Icons.search),
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
                              Text(
                                'Table',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    height: 2.4,
                                    letterSpacing: 0.5,
                                    color: Colors.grey),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    color: Colors.grey),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 120,
                                child: DropdownButtonFormField<String>(
                                  value: _selectedLanguage,
                                  hint: Text(_selectedLanguage.toString()),
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
                                      child: Text(value),
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
                      return screenProvider.isSearchScreenVisible
                          ? SearchScreen(
                              allProducts: prodProvider
                                  .getAllProducts(_searchController.text),filterProducts: updateSearchQuery,)
                          : controller.showPanierScreen
                              ? PanierScreen()
                              : ProductList(
                                  scrollController: _productScrollController,
                                  onCategorySelected: onCategorySelected,
                                  selectedCategoryIndex: _selectedCategoryIndex,
                                  onCategoryScroll: onCategoryScroll,
                                  onScrollDirectionChanged: (isScrollingDown) {
              setState(() {
                _hideTaskbar = isScrollingDown; 
              });
            },
                                );
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
