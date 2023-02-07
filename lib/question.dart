class Question {
  late String _questionText;
  late bool _questionAnswer;

  Question(String question, bool answer) {
    _questionText = question;
    _questionAnswer = answer;
  }

  String getQuestionText() {
    return _questionText;
  }

  bool getQuestionAnswer() {
    return _questionAnswer;
  }
}
