import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _selectedOption = 0;

  int get selectedOption {
    return _selectedOption;
  }

  set selectedOption( int index ) {
    _selectedOption = index;

    // notificamos al arbol de wigets
    notifyListeners();
  }
}