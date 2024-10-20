import 'package:flutter/material.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          children: [
            
            const SizedBox(height: 120),            
            const SizedBox(height: 50),
            const Text(
              "Quize Application ",
              style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 50),
            Image.asset(
              "assets/images/image.jpg",
              width: 350,
              height: 350,
            ),

            TextButton(onPressed: (){
              Navigator.pushNamed(context, '/home');
            }, child: const Text('Start ',  style :TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.black),))
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
