import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/views/pages/historique/commande_screen.dart';
import 'package:menu_digitale_tablette/views/widgets/history/commande_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool showFilters = false;
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
                      "Historique",
                      textAlign: TextAlign.center,
                      style: headline.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 80.w,
              child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          BackButton(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Historique de commandes", style: subhead),
                              const SizedBox(height: 5),
                              Text("Personaliser votre menu",
                                  style: body.copyWith(color: greyColor))
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: greyColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/icons/calendar.png"),
                                          const SizedBox(width: 5),
                                          Text(
                                            "JJ/MM/AAAA",
                                            style:
                                                body.copyWith(color: greyColor),
                                          )
                                        ],
                                      )))),
                          const SizedBox(width: 10),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  showFilters = !showFilters;
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: greyColor),
                                    color: showFilters ? darkPurpleColor : null,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/icons/filter-icon.png"),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Filtres",
                                            style: body.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: showFilters
                                                    ? Colors.white
                                                    : null),
                                          )
                                        ],
                                      )))),
                        ]),
                        const SizedBox(height: 10),
                        Visibility(
                            visible: showFilters,
                            child:
                                Wrap(spacing: 8.0, runSpacing: 8.0, children: [
                              ...List.generate(
                                  7,
                                  (index) => InkWell(
                                      onTap: () {},
                                      child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: greyColor),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                                vertical: 10,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                      "assets/icons/filter-icon.png"),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    "Commande sur place",
                                                    style: body.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              )))))
                            ])),
                        const SizedBox(height: 20),
                        Text("Aujourd’hui",
                            style: body.copyWith(color: greyColor)),
                        const SizedBox(height: 10),
                        ...List.generate(
                            10,
                            (index) => CommandeWidget(
                                  commandeName: "Commande sur place",
                                  productsNumber: 105,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CommandeScreeen()));
                                  },
                                ))
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
