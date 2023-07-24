class QuizQuestion {
  QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffleAnswers {
    final ans = List.of(answers);
    ans.shuffle();
    return ans;
  }
}
