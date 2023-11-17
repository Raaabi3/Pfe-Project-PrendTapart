import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommandeScreeen extends StatelessWidget {
  const CommandeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 10.h,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset("assets/icons/cocuisinage_logo.png"),
                  Text(
                    "Cocuisinage",
                    style: subhead.copyWith(color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      "Historique",
                      textAlign: TextAlign.center,
                      style: headline.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            const BackButton(),
                            const SizedBox(width: 5),
                            Text("Commande : # 01", style: subhead),
                          ]),
                          Text("Nombre des produits : 6 produits",
                              style: body.copyWith(color: greyColor)),
                          Text("Date du commande : 11/07/2023 - 11:44:34",
                              style: body.copyWith(color: greyColor)),
                          const SizedBox(height: 20),
                          ...List.generate(
                              5,
                              (index) => Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.network(
                                            "https://d2j6dbq0eux0bg.cloudfront.net/images/51235197/2146084191.jpg",
                                            fit: BoxFit.fill,
                                            height: 60,
                                            width: 50),
                                        const SizedBox(width: 15),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Tacos au polet",
                                                  style: body.copyWith(
                                                      color: greyColor)),
                                              Text("12,99€", style: subhead)
                                            ])
                                      ]))
                        ]),
                  ),
                ),
                const SizedBox(width: 10),
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Paiment", style: subhead),
                          Text("Paiment : Espéce",
                              style: body.copyWith(color: greyColor)),
                          const SizedBox(height: 20),
                          Row(
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("A payé",
                                  style: body.copyWith(
                                      fontWeight: FontWeight.w500)),
                              SizedBox(width: 20.w),
                              Text("46.00€",
                                  style: body.copyWith(
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("Sous totale ",
                                  style: body.copyWith(
                                      fontWeight: FontWeight.w500)),
                              SizedBox(width: 20.w),
                              Text("46.00€",
                                  style: body.copyWith(
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("Total",
                                  style: body.copyWith(
                                      fontWeight: FontWeight.w500)),
                              SizedBox(width: 20.w),
                              Text("46.00€",
                                  style: body.copyWith(
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ]),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
