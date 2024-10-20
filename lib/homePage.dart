import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_app/score_manager.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int selectedAnswerIndex = -1;
  bool showResult = false;
  List<double> answerPercentages = [60, 10, 30]; 
  int correctAnswerIndex = 2; 

void selectAnswer(int index) {
  if (index == correctAnswerIndex) {
    Provider.of<ScoreManager>(context, listen: false).increaseScore();
  }
  setState(() {
    selectedAnswerIndex = index;
    showResult = true;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: Colors.grey[400],
      ),
      drawer: const Drawer(
        child:
            Text("Achref", style: TextStyle(fontSize: 25, color: Colors.black)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/html.webp",
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text("Q1: What does 'HTML' stand for?",
                style: TextStyle(fontSize: 25, color: Colors.black)),
            const Text("1- Hyperlink and Text Markup Language",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            const Text("2- High-Level Text Markup Language",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            const Text("3- Hyper Text Markup Language",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            const SizedBox(height: 50),
            for (int i = 0; i < answerPercentages.length; i++)
              ElevatedButton(
                onPressed: showResult ? null : () => selectAnswer(i),
                style: ElevatedButton.styleFrom(
                  backgroundColor: showResult
                      ? (i == correctAnswerIndex
                          ? Colors.green
                          : (i == selectedAnswerIndex
                              ? Colors.red
                              : Colors.grey[400]))
                      : Colors.grey[400],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${i + 1}", 
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    if (showResult)
                      Text(
                        "${answerPercentages[i]}%",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 30),
            if (showResult)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Q2'); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text("Next",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }
}
