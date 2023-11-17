import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';

import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/views/widgets/parametre/parametre_button.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../jeux_popup/choisir_jeu_screen.dart';

class SuivieDeCommandeEtJeuxScreen extends StatefulWidget {
  const SuivieDeCommandeEtJeuxScreen({super.key});

  @override
  State<SuivieDeCommandeEtJeuxScreen> createState() =>
      _SuivieDeCommandeEtJeuxScreenState();
}

class _SuivieDeCommandeEtJeuxScreenState
    extends State<SuivieDeCommandeEtJeuxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Que souhaitez-vous commander ?",
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
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              "Votre panier : ",
                              style: headline,
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffF4F4F4)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Temp estimé : ",
                                      style: headline,
                                    ),
                                    const Icon(Icons.timer_outlined),
                                    Text(
                                      "10-15 mins",
                                      style: subhead,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "En attente(s) :",
                          style: subhead,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                  3,
                                  (index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Row(
                                          children: [
                                            Image.network(
                                              "https://d2j6dbq0eux0bg.cloudfront.net/images/51235197/2146084191.jpg",
                                              fit: BoxFit.fill,
                                              height: 60,
                                              width: 50,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Tacos au polet",
                                                  style: body,
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  "12,99€",
                                                  style: subhead.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.1),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => const ChoisirJeuPopUp(),
                              );
                            },
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.4,
                              child: Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/jouer.png",
                                  fit: BoxFit.fill,
                                ),
                              )),
                            )),
                      ),
                      Expanded(
                          child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Facturations : ",
                                      style: headline,
                                    ),
                                    Text(
                                      "38,97€",
                                      style: headline,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Actions :",
                                  style: subhead.copyWith(color: greyColor),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const ParametreButton(
                                  buttonText: "Passer une autre commande",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const ParametreButton(
                                  buttonText: "Modifier ma commande",
                                  color: Color(0xffEEEEEE),
                                  textColor: Color(0xff626262),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
