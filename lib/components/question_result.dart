import 'package:flutter/material.dart';

class QuestionResult extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionResult({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['correct_ans'] != data['chosen_ans']
                            ? const Color.fromARGB(255, 233, 111, 102)
                            : const Color.fromARGB(255, 132, 236, 186)),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 60, 32, 107),
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['correct_ans'] as String,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 199, 171, 246)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['chosen_ans'] as String,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 145, 239, 194)),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
