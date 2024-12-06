import 'package:ejercicio1/quizz.dart';
import 'package:ejercicio1/screen/question_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.empezarQuiz, {super.key,  });

  final void Function() empezarQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/quiz-logo.png',
            color: Colors.white.withOpacity(0.5),
            width: 250,
            height: 250,
          ),
          SizedBox(height: 30,),
          Text('Lean Flutter the Fun way !',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120.0),
            child: MaterialButton(onPressed: empezarQuiz,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_right_alt,),
                SizedBox(width: 15,),
                Text(
                  'Start Quiz',
                  style: TextStyle(
                  fontSize: 24,
                ),
                ),
              ],
            ),
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
