import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // shadow color
              spreadRadius: 1, // spread radius
              blurRadius: 4, // blur radius
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.dp), // Use redponsive sizing
                  topRight: Radius.circular(6.dp), // Use redponsive sizing
                ),
                child: Container(
                  height: 24.7917.h,
                  width: 23.5.w,
                  child: Image.network(
                    product.establishmentProducts[0]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 1.3542.h),
                  Container(
                     height: 2.5.h,
                        width: 11.11111111111111.w ,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        product.name,
                        maxLines: 2,
                        style: subhead.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    height:2.5.h ,
                      width:4.236111111111112.w ,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        '€' + product.establishmentProducts[0]['price'].toString(),
                        style: subhead.copyWith(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                       // Use redponsive sizing
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
