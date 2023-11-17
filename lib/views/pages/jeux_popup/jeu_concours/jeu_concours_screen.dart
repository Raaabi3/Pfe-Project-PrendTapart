import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:menu_digitale_tablette/views/pages/jeux_popup/jeu_concours/result_pop_up.dart';

class SpinningWheelScreen extends StatefulWidget {
  const SpinningWheelScreen({Key? key}) : super(key: key);

  @override
  State<SpinningWheelScreen> createState() => _SpinningWheelScreenState();
}

class _SpinningWheelScreenState extends State<SpinningWheelScreen> {
  final StreamController _dividerController = StreamController<int>();

  final _wheelNotifier = StreamController<double>();

  @override
  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
    super.dispose();
  }

  void _showResultPopup(BuildContext context, int selected) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ResultConcoursPopup();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      content: Builder(builder: (context) {
        return SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Tourner la roule !! ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff404040),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SpinningWheel(
                Image.asset('assets/images/roulette.png'),
                width: 310,
                height: 310,
                initialSpinAngle: _generateRandomAngle(),
                spinResistance: 0.6,
                canInteractWhileSpinning: false,
                dividers: 8,
                onUpdate: _dividerController.add,
                onEnd: (selected) {
                  _dividerController.add(selected);
                  _showResultPopup(context, selected);
                },
                secondaryImage:
                    Image.asset('assets/images/roulette-center.png'),
                secondaryImageHeight: 110,
                secondaryImageWidth: 110,
                shouldStartOrStop: _wheelNotifier.stream,
              ),
              const SizedBox(height: 30),
              StreamBuilder(
                stream: _dividerController.stream,
                builder: (context, snapshot) => snapshot.hasData
                    ? RouletteScore(snapshot.data as int)
                    : Container(),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  _wheelNotifier.sink.add(_generateRandomVelocity());
                },
                child: Container(
                  width: 200,
                  height: 60,
                  color: const Color(0xff2B3539),
                  child: const Center(
                    child: Text(
                      "Tourner",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      }),
    );
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '1000\$',
    2: '400\$',
    3: '800\$',
    4: '7000\$',
    5: '5000\$',
    6: '300\$',
    7: '2000\$',
    8: '100\$',
  };

  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}
