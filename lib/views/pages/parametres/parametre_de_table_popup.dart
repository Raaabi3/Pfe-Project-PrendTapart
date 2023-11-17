import 'package:flutter/material.dart';

import '../../widgets/parametre/parametre_dialog.dart';

class ParametreDeTablePopUp extends StatelessWidget {
  const ParametreDeTablePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ParametreDialog(
      titleText: "Nombre des tables",
      iconPath: "assets/icons/chair-icon.png",
      subtitleText: "Ajouter le nombre totale des tables dans le restaurant",
      buttonText: "Enregistrer",
      bodyContent: const TextField(
        decoration: InputDecoration(
            hintText: "Entrer le nombre ici",
            enabledBorder: OutlineInputBorder(),
            border: OutlineInputBorder()),
      ),
      onTap: () {},
    );
  }
}
