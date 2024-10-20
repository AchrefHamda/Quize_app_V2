import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'score_manager.dart';

class Finich extends StatelessWidget {
  const Finich({super.key});

  @override
  Widget build(BuildContext context) {
    int correctAnswers = Provider.of<ScoreManager>(context).correctAnswers;
    int totalQuestions = 5;
    double scorePercentage = Provider.of<ScoreManager>(context).getScorePercentage(totalQuestions);

    bool isPassed = scorePercentage >= 50;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Acceuil');
            },
            icon: const Icon(Icons.first_page),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            
            Image.asset(
              isPassed
                ? "assets/images/CN.webp" 
                : "assets/images/filed-img.jpg", 
              width: 200,
              height: 200,
            ),

            const SizedBox(height: 20),
            Text(
              isPassed
                ? "Congratulations!" 
                : "Better luck next time!", 
              style: const TextStyle(fontSize: 25, color: Colors.black),
            ),
            
            const SizedBox(height: 50),
            Text(
              "You answered $correctAnswers out of $totalQuestions correctly!",
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              "Your score: ${scorePercentage.toStringAsFixed(1)}%",
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Provider.of<ScoreManager>(context, listen: false).resetScore();
                Navigator.pushNamed(context, '/Acceuil');
              },
              child: const Text(
                'Back To Acceuil Page',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
