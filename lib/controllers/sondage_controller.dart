import 'package:flutter/material.dart';

class SondageController extends ChangeNotifier {
  int currentIndex = 0;
  List<int?> selectedAnswerIndices =
      List.filled(5, null); // List for each question

  Color cardCorlor(int index) {
    switch (index) {
      case 0:
        return const Color(0xffFEE7AD);
      case 1:
        return const Color(0xffFFDDF6);
      case 2:
        return const Color(0xffC9DBFE);

      default:
        return const Color(0xffFEE7AD);
    }
  }

  Color textColor(int index) {
    switch (index) {
      case 0:
        return const Color(0xffFAB300);
      case 1:
        return const Color(0xffEA00AC);
      case 2:
        return const Color(0xff0F5FFA);

      default:
        return const Color(0xffFAB300);
    }
  }

  void nextQuestion() {
    currentIndex++;
    notifyListeners();
  }

  void previousQuestion() {
    currentIndex--;
    notifyListeners();
  }

  void switchIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Map<String, dynamic>> questions = [
    {
      "questionText": "Quelle est votre recette préférée ?",
      "answers": [
        {"text": "Lasagnes", "choice": "A"},
        {"text": "Sushi", "choice": "B"},
        {"text": "Poulet rôti", "choice": "C"},
      ]
    },
    {
      "questionText": "Quelle est votre recette de dessert préférée ?",
      "answers": [
        {"text": "Tarte aux pommes", "choice": "A"},
        {"text": "Mousse au chocolat", "choice": "B"},
        {"text": "Crème brûlée", "choice": "C"},
      ]
    },
    {
      "questionText": "Quel plat de pâtes aimez-vous le plus ?",
      "answers": [
        {"text": "Spaghetti bolognese", "choice": "A"},
        {"text": "Penne à la carbonara", "choice": "B"},
        {"text": "Raviolis aux champignons", "choice": "C"},
      ]
    },
    {
      "questionText": "Quel est votre plat végétarien préféré ?",
      "answers": [
        {"text": "Curry de légumes", "choice": "A"},
        {"text": "Aubergines grillées", "choice": "B"},
        {"text": "Salade grecque", "choice": "C"},
      ]
    },
    {
      "questionText": "Quelle est votre recette de petit-déjeuner préférée ?",
      "answers": [
        {"text": "Pancakes aux fruits", "choice": "A"},
        {"text": "Croissants au beurre", "choice": "B"},
        {"text": "Smoothie bowl", "choice": "C"},
      ]
    }
  ];
}
