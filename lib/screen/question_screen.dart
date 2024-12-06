import 'dart:ffi';

import 'package:ejercicio1/components/answer.dart';
import 'package:ejercicio1/data/questions.dart';
import 'package:flutter/material.dart';

class Preguntas extends StatefulWidget {
  const Preguntas({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<Preguntas> createState() => _PreguntasState();
}

class _PreguntasState extends State<Preguntas> {


  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });

  }


  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: TextStyle(
                color:  Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 30,),
            ...currentQuestion.getRandomAnswer().map((answer) {
              return AnswerButton(text: answer, onTap: (){
                answerQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}

