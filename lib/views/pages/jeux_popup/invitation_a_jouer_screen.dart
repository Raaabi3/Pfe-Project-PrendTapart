import 'package:flutter/material.dart';

import '../../../Theme/my_text_styles.dart';
import 'choisir_jeu_screen.dart';

class InvitationAJouerPopUP extends StatelessWidget {
  const InvitationAJouerPopUP({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10),
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset("assets/icons/thinking_face.png"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Maintenant, vous voulez jouer à un jeu et gagner des prix magnifiques ?",
                  style: subhead.copyWith(
                    color: Color(0xff404040),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => ChoisirJeuPopUp(),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 55,
                    color: const Color(0xff2B3539),
                    child: Center(
                      child: Text("OUI!! Jouer",
                          style: subhead.copyWith(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
