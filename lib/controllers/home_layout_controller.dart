import 'package:flutter/material.dart';
import 'package:menu_digitale_tablette/views/pages/establishment/establishment_screen.dart';
import 'package:menu_digitale_tablette/views/pages/historique/history_screen.dart';
import 'package:menu_digitale_tablette/views/pages/home/home_screen.dart';

import '../views/pages/plan_de_table/plan_de_table_screen.dart';
import '../views/pages/suivi_commande_et_jeux/suivie_commande_jeux_screen.dart';

class HomeLayoutController extends ChangeNotifier {
  int currentScreenIndex = 0;
  void switchScreen(int index) {
    currentScreenIndex = index;
    notifyListeners();
  }

void resetSelectedCategoryIndex() {
  currentFoodTypeIndex = -1; 
  notifyListeners(); // Notify listeners after resetting the index
}

  int currentFoodTypeIndex = 0;
  void switchFoodTypeIndex(int index) {
    currentFoodTypeIndex = index;
    notifyListeners();
  }

  Widget getCurrentScreen() {
    switch (currentScreenIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return HistoryScreen();
      case 2:
        return PlanDeTableScreen();
      case 3:
        return SuivieDeCommandeEtJeuxScreen();
      case 4:
        return EstablishmentsScreen();
      case 5:
      return HomeScreen();  
      default:
        return HomeScreen();
    }
  }
}
