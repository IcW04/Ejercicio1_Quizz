import 'package:ejercicio1/components/questions_summary.dart';
import 'package:ejercicio1/data/questions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary =[];

    for (var i = 0; i < chosenAnswers.length; i++){
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answer[0],
          'user_answer': chosenAnswers[i],
        });
  }
  return summary;
}

  @override
  Widget build(BuildContext context) {
    final totalQuestion = questions.length;
    final correctQuestions = getSummaryData().where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;


    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tu Calificacion es $correctQuestions de $totalQuestion', style:
              TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 30,),
            QuestionsSummary(getSummaryData()),
            SizedBox(height: 30,),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.restart_alt),
                onPressed: onRestart,
                label: Text('Restart Quizz'),
            )
          ],
        ),
      ),
    );
  }
}
