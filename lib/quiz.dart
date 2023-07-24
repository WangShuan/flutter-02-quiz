import 'package:flutter/material.dart';
import 'package:quiz/data/qustions.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/results_screen.dart';

import './start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String _activeScreen = 'start';
  List<String> _selectedAnswers = [];

  void _toggleScreen() {
    setState(() {
      _activeScreen = 'question';
      _selectedAnswers = [];
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'restart';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: _activeScreen == 'start'
              ? StartScreen(_toggleScreen)
              : _activeScreen == 'restart'
                  ? ResultsScreen(_selectedAnswers, _toggleScreen)
                  : QuizScreen(_chooseAnswer),
        ),
      ),
    );
  }
}
