import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class AudioProvider extends ChangeNotifier{
  final _player = AudioPlayer();
  get player => _player;

  AudioProvider(){
    _player.onPlayerComplete.listen((event) {
      xPlay = false;
      currentIndex = -1;
      notifyListeners();
    });
  }
 

  int currentIndex = -1;
  bool xPlay = false;

  setPlay(int index){
    currentIndex = index;
    xPlay = true;
    notifyListeners();
  }

  setPause(){
    xPlay = false;
    notifyListeners();
  }
  setStop(){
    xPlay = false;
    currentIndex = -1;
    notifyListeners();
  }

@override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
 
}