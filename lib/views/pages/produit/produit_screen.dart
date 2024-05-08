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
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 300, // Set a specific width
                  child: DropdownButtonFormField<String>(
                    value: _selectedLanguage,
                    hint: Text(_selectedLanguage.toString()),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLanguage = newValue;
                      });
                    },
                    items:
                        languages.map<DropdownMenuItem<String>>((String value) {
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
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.name,
                            style: headline,
                          ),
                          Consumer<Products>(
                            builder: (context, provider, child) {
                              return Text(
                                widget.product.establishmentProducts[0]
                                    ['price'],
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    color: Colors.red[600]),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.product.description,
                        style: body,
                      ),
                      const SizedBox(height: 15),
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
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  if (widget.product.groups![groupIndex]
                                          .is_required ==
                                      1)
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            isSelected && group.is_required == 1
                                                ? Colors.green.shade400
                                                : Colors.grey.shade400,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        child: Text(
                                          'Obligatoire',
                                          style: TextStyle(
                                            color: isSelected &&
                                                    group.is_required == 1
                                                ? Colors.white
                                                : Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Choisissez jusqu'à ${group.maximumChoose}",
                                style: body,
                              ),
                              const SizedBox(height: 10),
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 50,
                                  enlargeCenterPage: false,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 0.3,
                                  initialPage: 1,
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
                                              ? Colors.red.shade500
                                              : Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        color: isSelected
                                            ? Colors.red.shade500
                                            : null,
                                      ),
                                      margin: const EdgeInsets.only(right: 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            option.name +
                                                " | " +
                                                "${option.price}€",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
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
                              const SizedBox(height: 20),
                            ],
                          );
                        },
                      ),
                      Text("Choissiser la quantité", style: TextStyle(color: Colors.black),),
                      Row(
                        children: [
                          IconButton(
                            icon: Transform.scale(
                              scaleX: 1.2,
                              child: Icon(
                                Icons.indeterminate_check_box,
                                color: const Color.fromARGB(255, 58, 50, 68),
                                size: 40,
                              ),
                            ),
                            onPressed: prodProvider.decrement,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              prodProvider.quantity.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          IconButton(
                            onPressed: prodProvider.increment,
                            icon: Transform.scale(
                              scaleX: 1.2,
                              child: Icon(
                                Icons.add_box,
                                color: const Color.fromARGB(255, 58, 50, 68),
                                size: 40,
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
                                            prodProvider.selectedOptionsList);
                                      }
                                    : null,
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    backgroundColor: prodProvider
                                        .isButtonEnabled(widget.product) ? MaterialStateProperty.all<Color>(
                                          Colors.red.shade600)
                                 
                                          : MaterialStateProperty.all<Color>(
                                          Colors.red.shade300),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical:14),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Ajouter Au Panier ' +
                                            (ProductsController().calculateTotalPrice(
                                                        widget.product,
                                                        prodProvider
                                                            .selectedOptionsList) *
                                                    prodProvider.quantity)
                                                .toStringAsFixed(2) +
                                            "€",
                                        style: const TextStyle(color: Colors.white),
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
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Single big image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: GestureDetector(
                      child: Image.network(
                        prodProvider.generateStaticCarouselImages(
                          widget.product,
                          widget.product.establishmentProducts,
                        ) [selectedImageIndex],
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: 300,
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
                  // List of small images
                  Flexible(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        initialPage: (prodProvider
                                    .generateStaticCarouselImages(
                                        widget.product,
                                        widget.product.establishmentProducts)
                                    .length /
                                2)
                            .toInt(),
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        enableInfiniteScroll: false,
                        aspectRatio: 4 / 1,
                        viewportFraction: 0.2,
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
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Ajouter des notes',
                        icon: Icon(Icons.sticky_note_2_outlined),
                        hintStyle: TextStyle(fontSize: 20),
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
