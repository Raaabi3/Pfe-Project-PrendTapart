import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_colors.dart';

import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/controllers/home_layout_controller.dart';
import 'package:menu_digitale_tablette/views/widgets/parametre/parametre_button.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PanierScreen extends StatelessWidget {
  const PanierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xffEDEDED),
            height: 10.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Spacer(),
                  Text(
                    "Ma commande",
                    style: headline,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Image.network(
                                "https://d2j6dbq0eux0bg.cloudfront.net/images/51235197/2146084191.jpg",
                                fit: BoxFit.fill,
                                width: 70,
                                height: 100,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xff3A3244)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "1",
                                    style: subhead,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xff3A3244)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ParametreButton(
              buttonText: "Passer Commande",
              onTap: () {
                Navigator.pop(context);
                context.read<HomeLayoutController>().switchScreen(3);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ParametreButton(
              buttonText: "Vider Panier",
              color: Color(0xffEEEEEE),
              textColor: Color(0xff626262),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
