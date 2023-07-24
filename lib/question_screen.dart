import 'package:flutter/material.dart';

import './answer_button.dart';
import './data/qustions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(this.chooseAnswer, {super.key});

  final Function(String) chooseAnswer;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_index];
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(
              letterSpacing: 0.5,
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ...currentQuestion.shuffleAnswers.map(
            (item) => AnswerButton(
              item,
              () {
                widget.chooseAnswer(item);
                setState(() {
                  _index++;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
