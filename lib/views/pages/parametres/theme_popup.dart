import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_text_styles.dart';
import '../../widgets/parametre/parametre_dialog.dart';

class ParametreThemePopUp extends StatelessWidget {
  const ParametreThemePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ParametreDialog(
      titleText: "Théme",
      iconPath: "assets/icons/pen-icon.png",
      subtitleText: "Personaliser votre menu",
      buttonText: "Enregistrer",
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Uncomment

              Image.asset("assets/icons/style-text-icon.png"),
              const SizedBox(width: 5),
              Text("Style de texte", style: body)
            ],
          ),
          const SizedBox(height: 5),
          Container(
            height: 50,
            width: 40.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffF5F5F5))),
            child: Center(
              child: Text(
                "Séléctioner un style de texte",
                style: body.copyWith(color: const Color(0xffF5F5F5)),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              // Uncomment

              Image.asset("assets/icons/text-color-icon.png"),
              const SizedBox(width: 5),
              Text("Couleur du texte", style: body)
            ],
          ),
          const SizedBox(height: 5),
          Container(
            height: 50,
            width: 40.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffF5F5F5))),
            child: Center(
              child: Container(height: 20, color: Colors.black),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              // Uncomment

              Image.asset("assets/icons/button-color-icon.png"),
              const SizedBox(width: 5),
              Text("Couleur des boutons", style: body)
            ],
          ),
          const SizedBox(height: 5),
          Container(
            height: 50,
            width: 40.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffF5F5F5))),
            child: Center(
              child: Container(height: 20, color: Colors.black),
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }
}
