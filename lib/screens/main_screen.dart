import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start';
  List<String> selectedAnswers = [];

  void addAnswer(String ans) {
    selectedAnswers.add(ans);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  void onRestart() {
    setState(() {
      activeScreen = 'start';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(getNextScreen: () {
      setState(() {
        activeScreen = 'active';
      });
    });

    if (activeScreen == 'active') {
      screenWidget = QuestionScreen(currAns: addAnswer);
    }
    if (activeScreen == 'result') {
      screenWidget = ResultScreen(
        answers: selectedAnswers,
        onRestart: onRestart
      );
    }

    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 71, 34, 134),
          body: screenWidget),
    );
  }
}
