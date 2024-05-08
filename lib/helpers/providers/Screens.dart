import 'package:flutter/material.dart';

class ScreenController extends ChangeNotifier {
  bool _showpaniericon = false;
  bool _showPanierScreen = false;
  bool _isSearchScreenVisible = false;
  List<bool> _showAllOptions = [];

  void setFloatingButtonVisibility(test) {}

  List<bool> get showAllOptions => List.from(_showAllOptions);
  bool get showpaniericon => _showpaniericon;
  bool get showPanierScreen => _showPanierScreen;
  bool get isSearchScreenVisible => _isSearchScreenVisible;

  void idlepanier() {
    _showpaniericon = !_showPanierScreen;
    notifyListeners();
  }

  void toggleScreen() {
    _showPanierScreen = !_showPanierScreen;
    notifyListeners();
  }

  void initializeShowAllOptions(int itemCount) {
    _showAllOptions = List.generate(itemCount, (_) => false);
    notifyListeners();
  }

  void toggleShowAllOptions(int index) {
    _showAllOptions[index] = !_showAllOptions[index];
    notifyListeners();
  }

  void togglesearchscreen(searchtext) {
    if (searchtext.isEmpty) {
      _isSearchScreenVisible = false;
    } else {
      _isSearchScreenVisible = true;
    }
    notifyListeners();
  }
}
