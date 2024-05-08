import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/views/pages/produit/produit_screen.dart';
import 'package:menu_digitale_tablette/views/widgets/product/product_card.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  final ScrollController scrollController;
  final Function(int) onCategorySelected;
  final int selectedCategoryIndex; 
    final Function(int) onCategoryScroll;
  final Function(bool) onScrollDirectionChanged;


  const ProductList({
    Key? key,
    required this.scrollController,
    required this.onCategorySelected, 
    required this.selectedCategoryIndex,
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
    final index = (widget.scrollController.offset / (MediaQuery.of(context).size.height /2.10));
    if (_currentIndex != index) {
      print("current idnex :"+_currentIndex.toString()+"index: "+index.toString());
      widget.onCategoryScroll(index.toInt()); 
      if (_currentIndex < index) {
    widget.onScrollDirectionChanged(true); 
    } else if (_currentIndex > index) {
    widget.onScrollDirectionChanged(false);
    }
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

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category.name,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                GridView.builder(
                  
                  key: keys[categoryIndex],
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: category.product.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final product = category.product[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProduitScreen(product: product),
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
    );
  }
}

