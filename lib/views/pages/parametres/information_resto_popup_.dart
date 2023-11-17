import 'package:flutter/material.dart';

import '../../../Theme/my_text_styles.dart';
import '../../widgets/parametre/parametre_dialog.dart';

class InformationRestoPopUp extends StatelessWidget {
  const InformationRestoPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ParametreDialog(
      titleText: "Informations du restaurant",
      iconPath: "assets/icons/info-icon.png",
      subtitleText: "Personaliser votre menu",
      buttonText: "Enregistrer",
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "Nom du restaurant:",
            style: subhead,
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
                hintText: "Cocuisinage",
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 25),
          Text("Logo", style: subhead),
          Text("Inclure l'emblème de votre restaurant.",
              style: body.copyWith(color: const Color(0xffF5F5F5))),
          const SizedBox(height: 20),
          Image.asset("assets/icons/upload-photo-icon.png",
              alignment: Alignment.center),
          const SizedBox(height: 5),
          Center(
            child: Text(
              "Taille 40px*40px",
              style: body.copyWith(color: const Color(0xffF5F5F5)),
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }
}
