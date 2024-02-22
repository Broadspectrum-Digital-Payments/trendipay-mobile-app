
import 'package:flutter/material.dart';

class BottomNavViewModel extends ChangeNotifier{
  int _selectedNavTab = 0;

  int get getSelectedNavTab => _selectedNavTab;

  set selectNavTab(int index){
    _selectedNavTab = index;
    notifyListeners();
  }

  set selectNavTabWithOutNotify(int index){
    _selectedNavTab = index;
  }
}