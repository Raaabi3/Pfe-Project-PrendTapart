import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/helpers/providers/Commandes.dart';
import 'package:menu_digitale_tablette/helpers/providers/Screens.dart';
import 'package:menu_digitale_tablette/views/pages/commande/commande_screen.dart';
import 'package:menu_digitale_tablette/views/pages/historique/commande_screen.dart';
import 'package:menu_digitale_tablette/views/pages/suivi_commande_et_jeux/suivie_commande_jeux_screen.dart';
import 'package:side_sheet/side_sheet.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Super'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Votre commande a été passée avec succès. '
            'Cliquez sur le bouton ci-dessous pour suivre l\'état de votre commande.',
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
            Navigator.pop(context);
            ScreenController().toggleCommandeScreen();
                          
            },
            child: const Text('Suivre votre commande'),
          ),
        ],
      ),
    );
  }
}
