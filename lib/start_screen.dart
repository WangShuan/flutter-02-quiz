import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.toggleScreen, {super.key});
  final void Function() toggleScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 240,
            color: Colors.white38,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.overlock(
              letterSpacing: 0.5,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_forward),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(
                width: 1.0,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
            onPressed: toggleScreen,
            label: const Text(
              'Start Quiz',
            ),
          )
        ],
      ),
    );
  }
}
