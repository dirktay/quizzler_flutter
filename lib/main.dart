// import 'package:dart:math'
import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
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
  List<Widget> scoreKeeper = [
//    Icon(Icons.check,color: Colors.green),
//    Icon(Icons.close,color: Colors.red),
  ];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.', //false,
    'Approximately one quarter of human bones are in the feet.', //true,
    'A slug\'s blood is green.', //true,
  ];
  List<bool> answers = [false, true, true];
  int questionIndex = 0;

  void nextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++; // = random.nextInt(3);
    } else {
      questionIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(questions);
    // print(questions[0]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionIndex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                if (answers[questionIndex] == true) {
                  print('you got it right!');
                } else {
                  print('You got it wrong...!');
                }
                setState(() {
                  scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
                  nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                if (answers[questionIndex] == false) {
                  print('you got it right!');
                } else {
                  print('You got it wrong...!');
                }
                setState(() {
                  scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
                  nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
