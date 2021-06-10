import 'quizquestions.dart';

class QuizLib {
  int _questionNumber = 0;
  List<Question> _questionSet = [
    Question(
        question: '1. India is the world’s largest producer of bananas.',
        answer: true),
    Question(
        question: '2. No Indian has ever won the Nobel Peace Prize',
        answer: false),
    Question(
        question: '3. The National Sport of India is Hockey.', answer: true),
    Question(
        question: '4. India has Qualified for the FIFA World Cup',
        answer: true),
    Question(
        question: '5. Roughly Fifty Percent of Indians work in agriculture',
        answer: true),
    Question(
        question: '6. Lata Mangeshkar won the Padma Bhushan in 1960.',
        answer: false),
    Question(
        question: '7. Plants observe oxygen from atmosphere.', answer: false),
    Question(question: '8. The Ramayana was written by Valmiki.', answer: true),
    Question(
        question: '9. First ODI (Cricket) in India was played in Ahemadabad.',
        answer: true),
    Question(
        question:
            '10. The first captain of the first ODI Indian team was Sunil Gavaskar.',
        answer: false),
    Question(question: 'QUIZ FINISHED ', answer: true)
  ];

  void nextQuestion() {
    // print(_questionSet.length);
    if (_questionNumber < _questionSet.length - 1) {
      _questionNumber++;
    }
  }

  bool quizFinished() {
    if (_questionNumber >= _questionSet.length - 1) {
      print("true");
      print(_questionNumber);
      return true;
    } else
      print("false");
    print(_questionNumber);
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
