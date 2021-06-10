import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/questionlib.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizLib quizLib = QuizLib();
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.cyan,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: QuizPage(),
        ),
      ),
    ));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreIcons = [];
  void checkAnswer(String userAnswer) {
    bool correctAnswer = quizLib.returnAnswer();
    setState(() {
      if (quizLib.quizFinished() == true) {
        Alert(
            context: context,
            title: 'Quiz is Completed',
            desc: 'You can Reset the Quiz Now',
            type: AlertType.warning,
            buttons: [
              DialogButton(
                  child: Text("Reset"),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    setState(() {
                      scoreIcons.clear();
                      quizLib.resetApp();
                    });
                  })
            ]).show();
      } else if (correctAnswer.toString() == userAnswer) {
        scoreIcons
            .add(Icon(CupertinoIcons.check_mark_circled, color: Colors.green));
      } else {
        scoreIcons.add(Icon(CupertinoIcons.xmark_circle, color: Colors.red));
      }
      quizLib.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 50.0),
            child: Text(
              quizLib.returnQuestion(),
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        ),
        ElevatedButton.icon(
          icon: Icon(CupertinoIcons.check_mark_circled),
          label: Text(
            "True",
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5),
          ),
          onPressed: () {
            checkAnswer('true');
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
        ),
        ElevatedButton.icon(
          label: Text("False",
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5)),
          icon: Icon(CupertinoIcons.xmark_circle),
          onPressed: () {
            checkAnswer('false');
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
        ),
        Row(
          children: scoreIcons,
        ),
      ],
    );
  }
}
