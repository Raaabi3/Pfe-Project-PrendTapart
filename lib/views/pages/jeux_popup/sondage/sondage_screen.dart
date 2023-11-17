import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../controllers/sondage_controller.dart';

class SondageScreen extends StatefulWidget {
  const SondageScreen({Key? key}) : super(key: key);

  @override
  State<SondageScreen> createState() => _SondageScreenState();
}

class _SondageScreenState extends State<SondageScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SondageController>(builder: (_, sondage, __) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10),
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        content: Builder(builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      sondage.questions.length,
                      (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 5),
                            height: 10,
                            width: sondage.currentIndex == index ? 25 : 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: sondage.currentIndex == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                            ),
                          ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.7,
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (int index) {
                      sondage.switchIndex(index);
                    },
                    controller: _pageController,
                    itemCount: sondage.questions.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Text(
                                sondage.questions[index]['questionText'],
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ...List.generate(
                                sondage.questions[index]['answers'].length,
                                (i) => GestureDetector(
                                      onTap: () {
                                        sondage.selectedAnswerIndices[index] =
                                            i;

                                        sondage.notifyListeners();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          height: 70,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            color: sondage.selectedAnswerIndices[
                                                        index] ==
                                                    null
                                                ? sondage.cardCorlor(i)
                                                : (sondage.selectedAnswerIndices[
                                                            index] ==
                                                        i)
                                                    ? sondage.cardCorlor(i)
                                                    : sondage
                                                        .cardCorlor(i)
                                                        .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color:
                                                  sondage.selectedAnswerIndices[
                                                              index] ==
                                                          i
                                                      ? sondage.textColor(i)
                                                      : Colors.transparent,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                sondage.questions[index]
                                                            ['answers'][i]
                                                        ['choice'] +
                                                    ") ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                      color:
                                                          sondage.textColor(i),
                                                    ),
                                              ),
                                              Text(
                                                sondage.questions[index]
                                                    ['answers'][i]['text'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      color:
                                                          sondage.textColor(i),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.05,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (sondage.currentIndex < 4) {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  sondage.nextQuestion();
                                } else {
                                  await Share.share('Bla bla bla');
                                }
                              },
                              child: Container(
                                width: 200,
                                height: 60,
                                color: const Color(0xff2B3539),
                                child: Center(
                                  child: Text(
                                    sondage.currentIndex < 4
                                        ? "Suivant"
                                        : "Terminer",
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        }),
      );
    });
  }
}
