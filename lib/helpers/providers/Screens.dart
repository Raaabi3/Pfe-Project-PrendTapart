import 'package:flutter/material.dart';

class ScreenController extends ChangeNotifier {
  bool _showpaniericon = false;
  bool _showPanierScreen = false;
  bool _isSearchScreenVisible = false;
  bool _isCommandeScreenVisible = false;
  bool _deslectCategory = false;
  bool _selectedcommandecard = false;
  bool _inproductscreen = false;
  bool _showtables = false;
  bool _iscommandeContentVisible = false;
  bool _hideTaskbar = false;
  List<bool> _showAllOptions = [];
  int _currentScreenIndex = 0;




  void setFloatingButtonVisibility(test) {}
  int get currentScreenIndex => _currentScreenIndex;
  List<bool> get showAllOptions => List.from(_showAllOptions);
  bool get showpaniericon => _showpaniericon;
  bool get showPanierScreen => _showPanierScreen;
  bool get isSearchScreenVisible => _isSearchScreenVisible;
  bool get isCommandeScreenVisible => _isCommandeScreenVisible;
  bool get deslectCategory => _deslectCategory;
  bool get selectedcommandecard => _selectedcommandecard;
  bool get inproductscreen => _inproductscreen;
  bool get showtables => _showtables;
  bool get iscommandeContentVisible => _iscommandeContentVisible;
  bool get hideTaskbar => _hideTaskbar;


void hidetaskbar(bool scrooldirection){
  _hideTaskbar=scrooldirection;
  print("the taskbars"+_hideTaskbar.toString());
  notifyListeners();
}
void showHideCommadneContent(){
  _iscommandeContentVisible= true;
  notifyListeners();
}

void showtable(){
  _showtables = !_showtables;
  notifyListeners();
}

  void toggleproductlist(){
    print("called here ");
    _inproductscreen= !_inproductscreen;
    notifyListeners();
  }



  void idlepanier() {
    _showpaniericon = !_showPanierScreen;
    notifyListeners();
  }

  void toggleScreen() {
    _showPanierScreen = !_showPanierScreen;
        _isSearchScreenVisible = false;
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
  void toggleCommandeScreen(){
    _isCommandeScreenVisible= !_isCommandeScreenVisible;
    notifyListeners();
  }
  void toggleselection(){
    _deslectCategory= !_deslectCategory;
    notifyListeners();
  }
  void togglecommandecardselection(){
    _selectedcommandecard= !_selectedcommandecard;
    notifyListeners();
  }

  void setCurrentScreenIndex(int index) {
    _currentScreenIndex = index;
    notifyListeners();
  }

  void toggleSearchScreen(bool show) {
    _isSearchScreenVisible = show;
    notifyListeners();
    }

    
}
