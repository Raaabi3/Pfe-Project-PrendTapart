import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/controllers/product_controller.dart';
import 'package:menu_digitale_tablette/helpers/providers/Cart.dart';
import 'package:menu_digitale_tablette/helpers/providers/Products.dart';
import 'package:menu_digitale_tablette/models/product_model/Product.dart';
import 'package:menu_digitale_tablette/views/widgets/product/product_imageoverlay.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class ProduitScreen extends StatefulWidget {
  final Product product;

  ProduitScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProduitScreenState createState() => _ProduitScreenState();
}

class _ProduitScreenState extends State<ProduitScreen> {
  int selectedImageIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    final Products prodProvider = Provider.of<Products>(context);
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    int quantity = 1;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            width: 2.2652777777777777.w,
            height: 4.0729166666666665.h,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
                shadows: [Shadow(color: Colors.black,offset: Offset.fromDirection(15))],
          
              ),
            ),
          ),
        ),
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44.w,
            child: Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.2222.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                widget.product.name,
                                style: headline,
                              ),
                            ),
                            Consumer<Products>(
                              builder: (context, provider, child) {
                                return Text(
                                  "€" +
                                      widget.product.establishmentProducts[0]
                                          ['price'],
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 2.w,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 0.5,
                                      color: Colors.red[600]),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 2.8125.h),
                        SingleChildScrollView(
                          child: Container(
                            width:538,
                            child: Text(
                              widget.product.description,
                              style: TextStyle(fontSize: 1.9.h,color: Colors.black,fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.8125.h),
                        Text(
                          "Piquant",
                          style: TextStyle(
                              color: Color.fromRGBO(221, 37, 53, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 1.3.w),
                        ),
                        SizedBox(height: 2.8125.h),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.product.groups!.length,
                          itemBuilder: (BuildContext context, int groupIndex) {
                            final group = widget.product.groups![groupIndex];
                            final isSelected = prodProvider.selectedOptionsList
                                .any((element) => element[group] != null);

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Quelle ${group.name} ?",
                                      style: subhead.copyWith(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 1.2.w,
                                          fontFamily: "Poppins"),
                                    ),
                                    const Spacer(),
                                    if (widget.product.groups![groupIndex]
                                            .is_required ==
                                        1)
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: isSelected &&
                                                  group.is_required == 1
                                              ? Color.fromRGBO(119, 178, 85, 1)
                                              : Colors.grey.shade400,
                                        ),
                                        child: Container(
                                          width: 8.w,
                                          height: 3.h,
                                          child: Center(
                                            child: Text(
                                              'Obligatoire',
                                              style: TextStyle(
                                                  color: isSelected &&
                                                          group.is_required == 1
                                                      ? Colors.white
                                                      : Colors.black54,
                                                  fontSize: 1.1.w,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  "Choisissez jusqu'à ${group.maximumChoose}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(163, 163, 163, 1),
                                      fontSize: 1.w),
                                ),
                                SizedBox(height: 1.h),
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: 5.3125.h,
                                    enlargeCenterPage: false,
                                    enableInfiniteScroll: false,
                                    viewportFraction: 0.3,
                                    initialPage: 0,
                                    padEnds: false,
                                  ),
                                  items: group.options!.map((option) {
                                    final isSelected = prodProvider
                                        .selectedOptionsList
                                        .any((element) =>
                                            element[group] == option);
                                    return GestureDetector(
                                      onTap: () {
                                        prodProvider.selectedOption(
                                            option, group);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isSelected
                                                ? Color.fromRGBO(238, 48, 65, 1)
                                                : Color.fromRGBO(
                                                    220, 220, 220, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: isSelected
                                              ? Colors.red.shade500
                                              : null,
                                        ),
                                        margin:
                                             EdgeInsets.only(right: 0.4861111111111111.w),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              option.name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 1.w,
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 0.3472222222222222.w),
                                              child: Text(
                                                "|",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        220, 220, 220, 1)),
                                              ),
                                            ),
                                            Text(
                                              "${option.price}€",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 1.w,
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 2.h),
                              ],
                            );
                          },
                        ),
                        Text(
                          "Choissiser la quantité",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 1.w,
                              fontWeight: FontWeight.w900),
                        ),
                        Row(
                          children: [

                            Container(
                              height: 8.866666666666666.h,
                              width: 4.631944444444444.w,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: IconButton(
                                  icon: Transform.scale(
                                    scaleX: 1.2,
                                    child: Icon(
                                      Icons.indeterminate_check_box,
                                      color: const Color.fromARGB(255, 58, 50, 68),
                                      size: 50,
                                    ),
                                  ),
                                  onPressed: prodProvider.decrement,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0.dp),
                              child: Text(
                                prodProvider.quantity.toString(),
                                style: TextStyle(
                                    fontSize: 2.w, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 8.866666666666666.h,
                              width: 4.631944444444444.w,
                              child: FittedBox(
                                child: IconButton(
                                  onPressed: prodProvider.increment,
                                  icon: Transform.scale(
                                    scaleX: 1.2,
                                    child: Icon(
                                      Icons.add_box,
                                      color: const Color.fromARGB(255, 58, 50, 68),
                                      size: 50,

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 7.h,
                                  width: 36.6667.w,
                                  child: ElevatedButton(
                                    onPressed: prodProvider
                                            .isButtonEnabled(widget.product)
                                        ? () {
                                            cartProvider.addItemToCart(
                                                widget.product,
                                                ProductsController()
                                                    .calculateTotalPrice(
                                                        widget.product,
                                                        prodProvider
                                                            .selectedOptionsList),
                                                prodProvider
                                                    .selectedOptionsList,
                                                prodProvider.quantity);
                                          }
                                        : null,
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      backgroundColor: prodProvider
                                              .isButtonEnabled(widget.product)
                                          ? MaterialStateProperty.all<Color>(
                                              Color.fromRGBO(221, 37, 53, 1))
                                          : MaterialStateProperty.all<Color>(
                                              Color.fromRGBO(248, 113, 125, 1)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:2.w,
                                          height: 2.5.h,
                                          child: FittedBox(
                                            
                                            fit: BoxFit.contain,
                                            child: Icon(
                                              Icons.shopping_cart_outlined,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:9.51388888888889.w,
                                          height: 2.5.h,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              'Ajouter Au Panier ' +
                                                  (ProductsController()
                                                              .calculateTotalPrice(
                                                                  widget.product,
                                                                  prodProvider
                                                                      .selectedOptionsList) *
                                                          prodProvider.quantity)
                                                      .toStringAsFixed(2) +
                                                  "€",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w200),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(right: 2.2916666666666665.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: GestureDetector(
                        child: Image.network(
                          prodProvider.generateStaticCarouselImages(
                            widget.product,
                            widget.product.establishmentProducts,
                          )[selectedImageIndex],
                          fit: BoxFit.cover,
                          width: double.maxFinite.h,
                          height: 56.h,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ImageOverlay(
                                imageUrls:
                                    prodProvider.generateStaticCarouselImages(
                                  widget.product,
                                  widget.product.establishmentProducts,
                                ),
                                initialIndex: selectedImageIndex,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          initialPage: 0,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          enableInfiniteScroll: false,
                          aspectRatio: 4 / 1,
                          viewportFraction: 0.3,
                          padEnds: false,
                
                        ),
                        items: prodProvider
                            .generateStaticCarouselImages(
                              widget.product,
                              widget.product.establishmentProducts,
                            )
                            .asMap()
                            .entries
                            .map((entry) {
                          final index = entry.key;
                          final image = entry.value;
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedImageIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        10), // Adjust the border radius as needed
                
                                    child: Image.network(
                                      image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      height: 8.333333333333332.h,
                      width: 54.58333333333333.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 2.7083333333333335.w,
                            height: 3.519791666666667.h,
                
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Icon(Icons.sticky_note_2_outlined))),
                          Container(
                            width: 10.86111111111111.w,
                            height: 3.1875.h,
                
                            child: FittedBox(
                            fit:BoxFit.contain, 
                            child: Text("Ajouter des notes",style:TextStyle(fontSize: 16, color: Colors.black)))),
                          
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
