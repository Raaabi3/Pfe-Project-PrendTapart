import 'package:flutter/material.dart';

import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';
import 'package:menu_digitale_tablette/controllers/home_layout_controller.dart';
import 'package:menu_digitale_tablette/views/pages/establishment/establishment_screen.dart';
import 'package:menu_digitale_tablette/views/pages/historique/history_screen.dart';
import 'package:menu_digitale_tablette/views/pages/login/login_screen.dart';
import 'package:menu_digitale_tablette/views/pages/parametres/code_de_securite_popup.dart';
import 'package:menu_digitale_tablette/views/pages/parametres/information_resto_popup_.dart';
import 'package:menu_digitale_tablette/views/pages/parametres/parametre_de_table_popup.dart';
import 'package:menu_digitale_tablette/views/pages/parametres/theme_popup.dart';
import 'package:menu_digitale_tablette/helpers/providers/Auth.dart';
import 'package:menu_digitale_tablette/views/pages/welcome/loginform.dart';
import 'package:menu_digitale_tablette/views/widgets/parametre/parametre_item.dart';
import 'package:provider/provider.dart';

class ParametreScreen extends StatefulWidget {
  const ParametreScreen({super.key});

  @override
  State<ParametreScreen> createState() => _ParametreScreenState();
}

class _ParametreScreenState extends State<ParametreScreen> {
  List itemsNames = [
    "Paramétres générales",
    "Historique",
    "Théme",
    "Besoin d’aide",
    "Logout",
    "Boutique"
  ];
  List itemsIcons = [
    "assets/icons/historique-icon.png",
    "assets/icons/historique-icon.png",
    "assets/icons/theme-icon.png",
    "assets/icons/question-mark-icon.png",
    "assets/icons/logout.png",
    "assets/icons/logout.png"

  ];
  bool parametreGeneraleSelected = false;

  @override
  Widget build(BuildContext context) {
    final Auth _provider =
        Provider.of<Auth>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              const BackButton(),
              const Spacer(),
              Image.asset("assets/icons/settings.png"),
              Text(
                "Paramétres",
                style: subhead,
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            // height: 35.h,
            width: double.infinity,
            decoration: const BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(width: 1.5)),
                gradient: LinearGradient(colors: [
                  Color(0xffFC7058),
                  Color(0xffF5C167),
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/icons/cocuisinage_logo.png"),
                Row(children: [
                  Text(
                    "Cocuisinage",
                    style: body.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 6),
                  ...List.generate(6,
                      (index) => const Icon(Icons.star, color: Colors.yellow))
                ]),
                const SizedBox(height: 15),
                Row(children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text("France rue 1234 ,France",
                      style: body.copyWith(color: Colors.white))
                ]),
                const SizedBox(height: 5),
                Row(children: [
                  const Icon(
                    Icons.phone,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text("123 123 123", style: body.copyWith(color: Colors.white))
                ]),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(itemsNames.length, (index) {
            return Visibility(
              visible: !parametreGeneraleSelected,
              child: ParametreItem(
                  onTap: () {
                    if (index == 0) {
                      setState(() {
                        parametreGeneraleSelected = true;
                      });

                      // index = 1 represents historique
                    }else if (index == 1) {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HistoryScreen()),
                    );}
                    // index = 2 represents Theme parametre
                    else if (index == 2) {
                      showDialog(
                          context: context,
                          builder: (context) => const ParametreThemePopUp());
                    } else if (index == 4) {
                      _provider.logout().then((result) {
                        if (result.isRight) {
                          showDialog(
                            context: context,
                            builder: (context) => LoginForm(),
                          );
                        } else {
                          print(result.left);
                        }
                      });
                    }else if (index == 5) {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EstablishmentsScreen()),
                    );
                        }
                  },
                  text: itemsNames[index],
                  iconPath: itemsIcons[index]),
            );
          }),
          Visibility(
              visible: parametreGeneraleSelected,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  parametreGeneraleSelected = false;
                                });
                              },
                              icon: const Icon(Icons.arrow_back)),
                          const SizedBox(width: 5),
                          Text("Paramétres générale",
                              style: body.copyWith(fontWeight: FontWeight.w700))
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 35),
                        width: double.infinity,
                        color: const Color(0xffF5F5F5),
                        child: Text("Paramétre de sécurité", style: body)),
                    ParametreItem(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      text: "Code de sécurité",
                      iconPath: "assets/icons/code-sec-icon.png",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const CodeDeSecuritePopUp());
                      },
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 25),
                        width: double.infinity,
                        color: const Color(0xffF5F5F5),
                        child: Text("Paramétre des tables", style: body)),
                    ParametreItem(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        text: "Nombres des tables",
                        iconPath: "assets/icons/table.png",
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  const ParametreDeTablePopUp());
                        }),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 25),
                        width: double.infinity,
                        color: const Color(0xffF5F5F5),
                        child: Text("Paramétre du restaurant", style: body)),
                    ParametreItem(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 25),
                        text: "Informations du restaurant",
                        iconPath: "assets/icons/resto-icon.png",
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  const InformationRestoPopUp());
                        }),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
