import 'package:flutter/material.dart';

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
            },
            child: const Text('Suivre votre commande'),
          ),
        ],
      ),
    );
  }
}
