import 'package:flutter/material.dart';
import 'package:quiz_app/components/question_result.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  final List<String> answers;
  final VoidCallback onRestart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < answers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_ans': questions[i].answers[0],
        'chosen_ans': answers[i]
      });
    }
    return summary;
  }

  const ResultScreen(
      {super.key, required this.answers, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData = getSummary();
    final int totalQuestions = questions.length;
    final int correctQuestions = summaryData
        .where((data) => data['correct_ans'] == data['chosen_ans'])
        .length;

    return Container(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'You answered $correctQuestions out of $totalQuestions questions correctly!',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionResult(summaryData: summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            icon: const Icon(Icons.replay),
            onPressed: () => onRestart(),
            label: const Text(
              'Start Again',
              style: TextStyle(fontSize: 18),
            ),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.white)),
          ),
        ]),
      ),
    );
  }
}
