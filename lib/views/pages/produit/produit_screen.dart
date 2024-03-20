import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/models/product_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProduitScreen extends StatefulWidget {
  final Product product;
  ProduitScreen({Key? key, required this.product}) : super(key: key);

    @override
  _ProduitScreenState createState() => _ProduitScreenState();
}
  class _ProduitScreenState extends State<ProduitScreen> {
  int tailleSelected = 0;
  int sauceSelected = 0;
  int boissonSelected = 0;
  int qte =1;


  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color(0xffFBF7FF),
        height: 10.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.product.priceByUnit.toString(),
                style: headline,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff3A3244)),
                    child: GestureDetector(
                      onTap: () {
if (qte < /*widget.product.maximumQuantityToOrder*/ 4){
                        setState(() {
                          qte++;
                          print(widget.product.id);
                        });
                        }
                        
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    qte.toString(),
                    style: subhead,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff3A3244)),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          qte--;
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.product.img,
                            fit: BoxFit.fill,
              height: 30.h,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.product.name,
                    style: headline,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.product.description,
                                        style: body,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Quelle taille ?",
                    style: subhead.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Choisissez jusqu'à 2",
                    style: body,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        tailleSelected = index;
                                        setState(() {});
                                      },
                                      behavior: HitTestBehavior.translucent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: tailleSelected == index
                                                ? const Color(0xff3A3244)
                                                : null,
                                            border:
                                                Border.all(color: greyColor),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 15),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Petit",
                                                style: body.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        tailleSelected == index
                                                            ? Colors.white
                                                            : null),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                color: greyColor,
                                                width: 1,
                                                height: 20,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Gratuit",
                                                style: body.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        tailleSelected == index
                                                            ? Colors.white
                                                            : null),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Une petite sauce en plus?",
                    style: subhead.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Choisissez jusqu'à 3",
                    style: body,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () {
                                sauceSelected = index;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: sauceSelected == index
                                      ? const Color(0xff3A3244)
                                      : null,
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "barbecue",
                                        style: body.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: sauceSelected == index
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        color: greyColor,
                                        width: 1,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "+ 2,00€",
                                        style: body.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: sauceSelected == index
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Un Boisson en plus?",
                    style: subhead.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Choisissez jusqu'à 3",
                    style: body,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () {
                                boissonSelected = index;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: boissonSelected == index
                                      ? const Color(0xff3A3244)
                                      : null,
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Orange",
                                        style: body.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: boissonSelected == index
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        color: greyColor,
                                        width: 1,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "+ 2,00€",
                                        style: body.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: boissonSelected == index
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
