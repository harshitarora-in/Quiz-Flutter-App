import 'quizquestions.dart';

class QuizLib {
  int _questionNumber = 0;
  List<Question> _questionSet = [
    Question(question: 'question 1', answer: true),
    Question(question: 'question 2', answer: false),
    Question(question: 'question 3', answer: true),
    Question(question: 'question 4', answer: false),
    Question(question: 'question 5', answer: true),
    Question(question: 'question 6', answer: false),
    Question(question: 'question 7', answer: true),
    Question(question: 'question 8', answer: false),
    Question(question: 'question 9', answer: true),
    Question(question: 'question 10', answer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionSet.length - 1) {
      _questionNumber++;
    }
  }

  bool quizFinished() {
    if (_questionNumber >= _questionSet.length - 1) {
      return true;
    } else
      return false;
  }

  bool returnAnswer() {
    return _questionSet[_questionNumber].answer;
  }

  String returnQuestion() {
    return _questionSet[_questionNumber].question;
  }

  void resetApp() {
    _questionNumber = 0;
  }
}
