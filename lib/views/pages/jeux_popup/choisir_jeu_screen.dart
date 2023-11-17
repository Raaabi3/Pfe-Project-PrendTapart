import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/views/pages/jeux_popup/sondage/sondage_screen.dart';

import '../../../Theme/my_text_styles.dart';
import 'jeu_concours/jeu_concours_screen.dart';

class ChoisirJeuPopUp extends StatelessWidget {
  const ChoisirJeuPopUp({super.key});

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
            height: MediaQuery.sizeOf(context).height * 0.5,
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text("Choisir un jeu",
                    style: subhead.copyWith(
                      color: const Color(0xff404040),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (context) => const SpinningWheelScreen());
                      },
                      child: Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.sizeOf(context).width >
                                          1200
                                      ? MediaQuery.sizeOf(context).height * 0.25
                                      : MediaQuery.sizeOf(context).height * 0.2,
                                  child:
                                      Image.asset("assets/images/roule.png")),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Tourner la roule", style: subhead),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (context) => const SondageScreen());
                      },
                      child: Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.sizeOf(context).width >
                                          1200
                                      ? MediaQuery.sizeOf(context).height * 0.25
                                      : MediaQuery.sizeOf(context).height * 0.2,
                                  child:
                                      Image.asset("assets/images/sondage.png")),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Faire un sondage", style: subhead),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }
}
