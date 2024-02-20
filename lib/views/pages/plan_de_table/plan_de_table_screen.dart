import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/views/pages/historique/commande_screen.dart';
import 'package:menu_digitale_tablette/views/widgets/history/commande_widget.dart';
import 'package:menu_digitale_tablette/views/widgets/parametre/parametre_button.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/home_layout_controller.dart';

class PlanDeTableScreen extends StatefulWidget {
  const PlanDeTableScreen({super.key});

  @override
  State<PlanDeTableScreen> createState() => _PlanDeTableScreenState();
}

class _PlanDeTableScreenState extends State<PlanDeTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 20.w,
        child: ParametreButton(
          buttonText: "Choisir",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
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
                      "Plan de Table",
                      textAlign: TextAlign.center,
                      style: headline.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            BackButton(
                              onPressed: () {
                                context
                                    .read<HomeLayoutController>()
                                    .switchScreen(0);
                              },
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Plan de tables",
                                      style: subhead.copyWith(
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 5),
                                  Text("Personaliser votre menu",
                                      style: body.copyWith(color: greyColor))
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    AutoSizeText(
                                      "Disponible",
                                      style: body.copyWith(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    AutoSizeText(
                                      "5 tables",
                                      style: body.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: greyColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    AutoSizeText(
                                      "Utilisée",
                                      style: body.copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    AutoSizeText(
                                      "20 tables",
                                      style: body.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: pinkColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "Bienvenu chez Cocuisinage",
                            style: headline,
                          ),
                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 50,
                                  mainAxisExtent: 150,
                                  mainAxisSpacing: 10),
                          itemCount: 8,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/table.png"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Table 0${index + 1}",
                                    style: body.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Table a deux",
                                    style: body.copyWith(color: greyColor),
                                  )
                                ],
                              ),
                            );
                          }),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
