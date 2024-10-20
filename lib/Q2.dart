import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_app/score_manager.dart';

class Q2 extends StatefulWidget {
  const Q2({super.key});

  @override
  _Q2State createState() => _Q2State();
}

class _Q2State extends State<Q2> {
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
                Navigator.pushNamed(context, '/home');
              },
              icon: const Icon(Icons.first_page)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Q2');
              },
              icon: const Icon(Icons.last_page)),
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
              "assets/images/IA.png",
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text("Q2: What does the abbreviation 'AI' stand for?",style: TextStyle(fontSize: 25, color: Colors.black)),
            const Text("1- Advanced Interface",style: TextStyle(fontSize: 20, color: Colors.black)),
            const Text("2- Artificial Intelligence",style: TextStyle(fontSize: 20, color: Colors.black)),
            const Text("3- Automated Information",style: TextStyle(fontSize: 20, color: Colors.black)),

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
                      i == 0
                          ? "1"
                          : i == 1
                              ? "2"
                              : "3",
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
                  Navigator.pushNamed(context, '/Q3'); 
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
