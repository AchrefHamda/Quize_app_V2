import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_app/score_manager.dart';

class Q4 extends StatefulWidget {
  const Q4({super.key});

  @override
  _Q4State createState() => _Q4State();
}

class _Q4State extends State<Q4> {
  int selectedAnswerIndex = -1;
  bool showResult = false;
  List<double> answerPercentages = [10, 70, 20]; 
  int correctAnswerIndex = 1; 
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Q3');
            },
            icon: const Icon(Icons.first_page),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Q5');
            },
            icon: const Icon(Icons.last_page),
          ),
        ],
      ),
      drawer: const Drawer(
        child: Text("Achref", style: TextStyle(fontSize: 25, color: Colors.black)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/Flutter.png",
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text("Q4: What is Flutter primarily used for?",
                style: TextStyle(fontSize: 25, color: Colors.black)),
            const Text("1- Game development",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            const Text("2- Mobile app development for Android and iOS",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            const Text("3- Building server-side applications",
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
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 30),
            if (showResult)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Q5'); 
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
