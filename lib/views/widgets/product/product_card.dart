import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(
                      product.establishmentProducts[0]['image'],
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 210,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.red.shade700,
                            size: 15,
                          ),
                          Text(
                            "10-15 mins",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            AutoSizeText(
              product.name,
              maxLines: 1,
              style:
                  subhead.copyWith(fontWeight: FontWeight.w700, fontSize: 16),
            ),
                        SizedBox(height: 8),

            Text('€' + product.establishmentProducts[0]['price'].toString(),
                style: subhead.copyWith(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}
