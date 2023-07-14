import 'package:flutter/material.dart';
import '../components/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  final Function currAns;
  const QuestionScreen({super.key, required this.currAns});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;
  void onPressHandler(String ans) {
    setState(() {
      index += 1;
    });
    widget.currAns(ans);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            questions[index].text,
            style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          ...questions[index].shuffledAnswers.map((item) {
            return AnswerButton(
              answerText: item,
              onPressHandler: onPressHandler,
            );
          }),
        ],
      ),
    );
  }
}
