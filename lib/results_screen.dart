import 'package:flutter/material.dart';
import 'package:quiz/data/qustions.dart';
import 'package:quiz/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedAnswers, this.toggleScreen, {super.key});
  final List<String> selectedAnswers;
  final void Function() toggleScreen;

  List<Map<String, Object>> get _summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'index': i,
        'question': questions[i].text,
        'answer': questions[i].answers[0],
        'selectedAnswer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = _summaryData;
    final total = questions.length;
    final corrent = summary
        .where((element) => element['answer'] == element['selectedAnswer'])
        .length;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '您答對了 $corrent / $total 題！',
            style: const TextStyle(
              letterSpacing: 0.5,
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          QuestionSummary(summary),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.restart_alt),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(
                width: 1.0,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
            onPressed: toggleScreen,
            label: const Text('Restart'),
          )
        ],
      ),
    );
  }
}
