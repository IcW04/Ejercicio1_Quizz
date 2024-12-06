class QuizQuestion{
  QuizQuestion(this.text, this.answer);
  final String text;
  final List<String> answer;

  List<String> getRandomAnswer(){
    final randomList = List.of(answer);
    randomList.shuffle();
    return randomList;
  }
}