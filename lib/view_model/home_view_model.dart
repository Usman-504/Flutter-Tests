import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier{
  int _counter = 0;
  int get count => _counter;

  void incrementCount(){
    _counter++;
    notifyListeners();
  }

  void decrementCount(){
    _counter--;
    notifyListeners();
  }

}