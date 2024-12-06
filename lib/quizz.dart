import 'package:ejercicio1/screen/result_screen.dart';
import 'package:ejercicio1/screen/start_screen.dart';
import 'package:ejercicio1/screen/question_screen.dart';
import 'package:flutter/material.dart';

import 'data/questions.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  State<Quizz> createState() => _QuizzState();
}
class _QuizzState extends State<Quizz> {
  List<String> selectAnswers =[];

  @override

  var startScreen = 'start-screen';

  void changeScreen(){
    setState(() {
      startScreen = 'question-screen';
    });
}

  void chooseAnswers(String answer){
    selectAnswers.add(answer);
    if(selectAnswers.length == questions.length ){
      setState(() {
        startScreen = 'results-screen';
      });
    }

  }

  void restartQuiz(){
    setState(() {
      selectAnswers =[];
      startScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(changeScreen);

    if(startScreen == 'question-screen'){
      screenWidget = Preguntas(onSelectAnswer: chooseAnswers);
    }

    if(startScreen == 'results-screen'){
      screenWidget =  ResultScreen(
        chosenAnswers: selectAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purple,
                      Colors.deepPurpleAccent
                    ])
            ),
            child: screenWidget,
          ),
        )
    );
  }
}
