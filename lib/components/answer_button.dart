import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    Key? key,
    required this.answerText,
    required this.onPressHandler,
  }) : super(key: key);

  final String answerText;
  final Function onPressHandler;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () => onPressHandler(answerText),
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 39, 21, 68),
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            child: Text(
              answerText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
