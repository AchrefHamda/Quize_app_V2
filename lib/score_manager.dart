import 'package:flutter/material.dart';

class ScoreManager extends ChangeNotifier {
  int correctAnswers = 0;

  void increaseScore() {
    correctAnswers++;
    notifyListeners();
  }

  double getScorePercentage(int totalQuestions) {
    return (correctAnswers / totalQuestions) * 100;
  }

  void resetScore() {
    correctAnswers = 0;
    notifyListeners();
  }
}
