import 'dart:math';

import 'package:flutter/material.dart';

class ForbiddenSequelProvider extends ChangeNotifier {
  List<int> sequence = [];

  int? activeIndex;
  int currentSequenceIndex = 0;
  
  bool isPlayerTurn = false;
  bool isGameLose = false;
  bool isGameStarted = false;

  int score = 0;

  void startGame() {
    sequence = [];
    score = 0;
    activeIndex = null;
    isGameStarted = true;
    isGameLose = false;
    startSystemTurn();
    notifyListeners();
  }

  void endGame() {
    isGameStarted = false;
    isPlayerTurn = false;
    isGameLose = true;
    notifyListeners();
  }

  void playSequence() async {
    addNumberToSequence(Random().nextInt(5));
    for (var index in sequence) {
      setActiveIndex(index);
      await Future.delayed(const Duration(milliseconds: 300));
      setActiveIndex(null);
      await Future.delayed(const Duration(milliseconds: 200));
    }
    startPlayerTurn();
  }

  void playerTry(int index) async {
    setActiveIndex(index);
    if (index == sequence[currentSequenceIndex]) {
      currentSequenceIndex++;
      if (currentSequenceIndex == sequence.length) {
        score++;
        startSystemTurn();
      }
      await Future.delayed(const Duration(milliseconds: 300));
      setActiveIndex(null);
    } else {
      endGame();
      notifyListeners();
    }
  }

  void addNumberToSequence(int number) {
    sequence.add(number);
    notifyListeners();
  }

  void startSystemTurn() async {
    isPlayerTurn = false;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    playSequence();
  }

  void startPlayerTurn() async {
    isPlayerTurn = true;
    currentSequenceIndex = 0;
    notifyListeners();
  }

  void setActiveIndex(int? index) {
    activeIndex = index;
    notifyListeners();
  }
}
