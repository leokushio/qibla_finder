import 'package:flutter/material.dart';


class AudioProvider extends ChangeNotifier{

  int currentIndex = 0;
  bool xPlay = false;

  setPlay(int index) {
    currentIndex = index;
    xPlay = true;
    notifyListeners();
  }

  setPause(){
    xPlay = false;
    notifyListeners();
  }


 
}