import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/views/pages/produit/produit_screen.dart';
import 'package:menu_digitale_tablette/views/widgets/product/product_card.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  final ScrollController scrollController;
  final Function(int) onCategorySelected;
  final Function(int) onCategoryScroll;
  final Function(bool) onScrollDirectionChanged;

  const ProductList({
    Key? key,
    required this.scrollController,
    required this.onCategorySelected,
    required this.onCategoryScroll,
    required this.onScrollDirectionChanged,
  }) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late List<GlobalKey> keys;
  late Products prodProvider;
  late double _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0.0;
    widget.scrollController.addListener(_scrollListener);
    keys = [];
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final index = (widget.scrollController.offset /
        (MediaQuery.of(context).size.height / 3.2));

    if (_currentIndex != index) {
      widget.onCategoryScroll(index.toInt());
      if (_currentIndex < index) {
        widget.onScrollDirectionChanged(true);
      } else if (_currentIndex > index) {
        widget.onScrollDirectionChanged(false);
      }
      print("current :" +
          _currentIndex.toString() +
          " idnex :" +
          index.toString());
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final prodProvider = Provider.of<Products>(context);
    if (prodProvider.categories.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      height: 85.625.h,
      width: 71.25.w,
      child: Column(
        children: [
          /*Container(
  width: 70.5556.w,
  height: 22.0833.h,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(7), // Set the same radius as the container
    child: Image.asset(
      "assets/images/ads.jpeg",
      fit: BoxFit.cover,
    ),
  ),
),*/
          Expanded(
            child: ListView.builder(
              controller: widget.scrollController,
              itemCount: prodProvider.categories.length,
              itemBuilder: (BuildContext context, int categoryIndex) {
                final category = prodProvider.categories[categoryIndex];
                if (keys.length <= categoryIndex) {
                  keys.add(GlobalKey());
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.0833.w),
                      child: Container(
                        width: 10.708333333333334.w,
                        height: 5.h,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            category.name,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(61, 61, 61, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                      key: keys[categoryIndex],
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 31.9688.w,
                        mainAxisExtent: 34.5109.h,
                      ),
                      itemCount: category.product.length,
                      itemBuilder: (BuildContext ctx, index) {
                        final product = category.product[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProduitScreen(product: product),
                              ),
                            );
                          },
                          child: ProductCard(product: product),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
