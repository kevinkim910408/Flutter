import 'package:flutter/material.dart';
import 'question.dart';
import 'dart:io';

QuestionBank questionBank = QuestionBank();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Machine App',
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userInput) {
    bool correctAnswer = questionBank.getQuestionCorrect();
    setState(() {
      if (questionBank.isFinished() == true) {
        print('DONE');
        questionBank.reset();
        sleep(const Duration(seconds: 10));
        scoreKeeper = [];
      } // if
      else {
        if (userInput == correctAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
              size: 35.0,
            ),
          );
        } // if
        else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
              size: 35.0,
            ),
          );
        }
        questionBank.nextQuestion(); // else
      } // else
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: Center(
                child: Text(
                  'TRUE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              child: Center(
                child: Text(
                  'FALSE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
