import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback getNextScreen;

  const StartScreen({
    Key? key,
    required this.getNextScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'images/quiz-logo.png',
            width: 280,
            color: Colors.white30,
          ),
        ),
        const SizedBox(
          height: 80.0,
        ),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontFamily: 'Lato'),
        ),
        const SizedBox(
          height: 30.0,
        ),
        OutlinedButton.icon(
            onPressed: getNextScreen,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
  }
}
