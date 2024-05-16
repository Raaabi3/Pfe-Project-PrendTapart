import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:menu_digitale_tablette/helpers/providers/Commandes.dart';
import 'package:menu_digitale_tablette/helpers/providers/Screens.dart';
import 'package:menu_digitale_tablette/models/commande_model.dart';
import 'package:menu_digitale_tablette/views/widgets/commande/commande_card.dart';
import 'package:provider/provider.dart';

class CommandesScreen extends StatefulWidget {
  CommandesScreen({Key? key}) : super(key: key);

  @override
  State<CommandesScreen> createState() => _CommandesScreenState();
}

class _CommandesScreenState extends State<CommandesScreen> {
  List<bool> showAllOptions = [];
  List<String> status = ["En attente", "En cours", "Terminé"];

  @override
  Widget build(BuildContext context) {
    Commandes cmdProvider = Provider.of<Commandes>(context);
    return Scaffold(
      body: Consumer<ScreenController>(
        builder: (context, screenController, child) {
          return screenController.iscommandeContentVisible
              ? Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 3.229166666666667.h,
                            width: 15.48611111111111.w,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text("Ma commande ()",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'poppins')),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.791666666666667.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 0.5.w),
                                  child: Container(
                                    height: 2.5.h,
                                    width: 12.847222222222221.w,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text('Commande attente',
                                          style: TextStyle(
                                              fontSize: 1.5.w,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'poppins',
                                              color: Color.fromRGBO(
                                                  23, 87, 129, 1))),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromRGBO(244, 244, 244, 1),
                                  ),
                                ),
                                SizedBox(width: 1.w),
                                Container(
                                    height: 1.875.h,
                                    width: 4.791666666666667.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromRGBO(244, 244, 244, 1)),
                                    child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                            cmdProvider
                                                    .countproduct("")
                                                    .toString() +
                                                ' produits',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)))),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Consumer<Commandes>(
                              builder: (context, commandesProvider, child) {
                                if (commandesProvider
                                    .commandebystatus[status[commandesProvider.card]]!
                                    .isEmpty) {
                                  return Center(
                                    child: Text("No commandes found."),
                                  );
                                }
                                return ListView.separated(
                                  itemCount: commandesProvider.commandes!.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          Divider(),
                                  itemBuilder: (context, commandeIndex) {
                                    final commande = commandesProvider
                                        .commandes![commandeIndex];

                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: 4.305555555555555.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 20.0.dp),
                                            child: Container(
                                              height: 3.083333333333333.h,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text(
                                                  'ID Commande #${commande.commande_id}',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          221, 37, 53, 1),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "poppins"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          ..._buildProductInfoList(commande,
                                              context, commandeIndex),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4.444444444444445.w,
                          3.6458333333333335.h, 4.097222222222222.w, 0),
                      child: Column(
                        children: [
                          CustomCard(
                            title: "En attente",
                            subtitle:
                                "Les commandes que vous avez commandées et en attente",
                            buttonText: "Ouvrir",
                            borderColor: Color.fromRGBO(255, 153, 0, 1),
                            titleColor: Color.fromRGBO(255, 153, 0, 1),
                            cardIndex: 0,
                          ),
                          CustomCard(
                            title: "En cours",
                            subtitle: "Les commandes en cours de préparation",
                            buttonText: "Ouvrir",
                            borderColor: Color.fromRGBO(23, 87, 129, 1),
                            titleColor: Color.fromRGBO(23, 87, 129, 1),
                            cardIndex: 1,
                          ),
                          CustomCard(
                            title: "Terminé",
                            subtitle: "Les commandes terminées",
                            buttonText: "Ouvrir",
                            borderColor: Color.fromRGBO(31, 187, 56, 1),
                            titleColor: Color.fromRGBO(31, 187, 56, 1),
                            cardIndex: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0.dp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.w,
                          child: Text(
                            'Votre commande a été passée avec succès',
                            style: TextStyle(
                              fontSize: 2.w,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          width: 35.w,
                          child: Text(
                            'Vous pouvez suivre l’étape de préparation de votre commande en cliquant sur le bouton ci-dessous',
                            style: TextStyle(
                                fontSize: 1.3.w, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(238, 48, 65, 1)),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(color: Colors.white),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all<Size>(Size(10.w, 8.h)),
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              )),
                          onPressed: () {
                            screenController.showHideCommadneContent();                         },
                          child: Text(
                            'Suivre ma commande',
                            style: TextStyle(color: Colors.white, fontSize: 1.2.w),
                          ),
                        ),
                        SizedBox(height: 5.5208.h),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                Container(
                                  height: 53.645833333333336.h,
                                  width: 24.305555555555554.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Same radius as the container
                                    child: Image.asset(
                                      "assets/images/foodimg1.jpeg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.0417.w,
                                ),
                                Flexible(
                                    child: Padding(
                                  padding: EdgeInsets.only(top: 2.3958.h),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 21.3542.h,
                                        width: 24.2361.w,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            "assets/images/foodimg2.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.7708.h,
                                      ),
                                      Container(
                                        height: 28.125.h,
                                        width: 24.2361.w,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                              "assets/images/foodimg3.jpeg",
                                              fit: BoxFit.cover),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                                SizedBox(
                                  width: 1.0417.w,
                                ),
                                Container(
                                  width: 24.3056.w,
                                  height: 49.583333333333336.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                        "assets/images/foodimg4.jpeg",
                                        fit: BoxFit.cover),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  List<Widget> _buildProductInfoList(
      Commande commande, BuildContext context, int commandeIndex) {
    List<Widget> productInfoList = [];
    if (commande.products != null) {
      for (int productIndex = 0;
          productIndex < commande.products!.length;
          productIndex++) {
        productInfoList.add(_buildProductInfo(context, commandeIndex,
            productIndex, commande.products![productIndex], commande));
      }
    }
    return productInfoList;
  }

  Widget _buildProductInfo(BuildContext context, int commandeIndex,
      int productIndex, dynamic product, Commande commande) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              child: Container(
                  height: 9.270833333333334.h,
                  width: 8.472222222222223.w,
                  child: Image.network(
                    "${product.establishmentProducts[0]['image']}",
                    fit: BoxFit.cover,
                  ),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(14))),
            ),
            SizedBox(
              width: 1.3888888888888888.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 3.h,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 0.9552.h),
                if (commande.options != null && commande.options!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: commande.options!.sublist(0, 2).map((option) {
                          return Container(
                            height: 3.h,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "* ${option['option']}",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      if (commande.options!.length > 2)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // showAllOptions[productIndex] = !showAllOptions[productIndex];
                            });
                          },
                          child: Text(
                            "Voir plus",
                            //showAllOptions[productIndex] ? "Voir moins" : "Voir plus",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
            Spacer(),
            Container(
                height: 2.7708333333333333.h,
                width: 8.8194.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(255, 248, 224, 1),
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text("${commande.status}",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 153, 0, 1), fontSize: 13)),
                )),
            SizedBox(
              width: 4.5139.w,
            ),
          ],
        ),
        SizedBox(
          height: 4.895833333333333.h,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 20.76388888888889.w,
            height: 5.833333333333333.h,
            child: ElevatedButton(
              onPressed: () {
                Provider.of<ScreenController>(context, listen: false)
                    .toggleCommandeScreen();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(238, 48, 65, 1)),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(color: Colors.white),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  )),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "Passer la commande ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        )
//      if (showAllOptions[productIndex] && commande.options != null && commande.options!.length > 2)
      ],
    );
  }
}
