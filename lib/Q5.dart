import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_app/score_manager.dart';

class Q5 extends StatefulWidget {
  const Q5({super.key});

  @override
  _Q5State createState() => _Q5State();
}

class _Q5State extends State<Q5> {
  int selectedAnswerIndex = -1;
  bool showResult = false;
  List<double> answerPercentages = [80, 10, 10]; // Dummy percentages for Q5
  int correctAnswerIndex = 0; // Index of the correct answer for Q5

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
              Navigator.pushNamed(context, '/Q4');
            },
            icon: const Icon(Icons.first_page),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Finich');
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
          mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/DM.png",
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text("Q5: What is SEO an abbreviation for in digital marketing?",
                style: TextStyle(fontSize: 25, color: Colors.black)),
            const SizedBox(height: 20),
            // Display answers above the question
            const Text("1- Search Engine Optimization",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            const Text("2- Social Engagement Online",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            const Text("3- Site Efficiency Overview",
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
                  Navigator.pushNamed(context, '/Finich'); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text("Finish",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }
}
