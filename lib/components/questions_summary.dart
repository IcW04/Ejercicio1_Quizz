import 'package:flutter/material.dart';

class QuestionsSummary  extends StatelessWidget {
  const QuestionsSummary (this.summaryData ,{super.key,  });

    final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: summaryData.map((data){
          return Row
            (children: [
              Text(((data['question_index'] as int) + 1).toString(), style:
                TextStyle(
                  color: Colors.white
                ),),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['question'] as String, style:
                      TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                  const SizedBox(height: 5,),
                  Text(data['user_answer'] as String, style:
                    TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),),
                  const SizedBox(height: 5,),
                  Text(data['correct_answer'] as String, style:
                    TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold
                    ),)
                ],
              ),
            )
          ],);
      }).toList(),
      ),
    );
  }
}
