import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:menu_digitale_tablette/views/pages/produit/produit_screen.dart';
import 'package:menu_digitale_tablette/views/widgets/product/product_card.dart';

class SearchScreen extends StatefulWidget {
  final List<Product> allProducts;
  final Function(String) filterProducts; 


  const SearchScreen({Key? key, required this.allProducts,required this.filterProducts}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Product> _filteredProducts;

  @override
  void initState() {
    super.initState();
    _filteredProducts = widget.allProducts; 
    
  }

 
void filterProducts(String query) {
    setState(() {
      _filteredProducts = widget.allProducts.where((product) =>
        product.name.toLowerCase().contains(query.toLowerCase())
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _filteredProducts.isEmpty
          ? Center(
              child: Text('Start typing to search for products'),
              
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _filteredProducts.length,
              itemBuilder: (BuildContext context, int index) {
                final product = _filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProduitScreen(
                          product: product,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductCard(product: product),
                  ),
                );
              },
            ),
    );
  }
}