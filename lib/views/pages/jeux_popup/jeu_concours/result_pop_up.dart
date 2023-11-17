import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/Theme/my_text_styles.dart';

class ResultConcoursPopup extends StatefulWidget {
  const ResultConcoursPopup({Key? key}) : super(key: key);

  @override
  State<ResultConcoursPopup> createState() => _ResultConcoursPopupState();
}

class _ResultConcoursPopupState extends State<ResultConcoursPopup> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 3));
    _controllerCenter.play();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();

    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.35,
              width: MediaQuery.sizeOf(context).width * 0.65,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _controllerCenter,
                      blastDirectionality: BlastDirectionality
                          .explosive, // don't specify a direction, blast randomly
                      shouldLoop:
                          true, // start again as soon as the animation is finished
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.pink,
                        Colors.orange,
                        Colors.purple
                      ], // manually specify the colors to be used
                      createParticlePath:
                          drawStar, // define a custom shape/path.
                    ),
                  ),
                  Image.asset("assets/images/congrats.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Bravo!\nVous aver gagner ",
                      textAlign: TextAlign.center, style: headline),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("400\$", style: headline),
                  const SizedBox(
                    height: 10,
                  ),
                  // CustomButton(txt: "Prend mon prix", fun: () {})
                ],
              ));
        },
      ),
    );
  }
}
