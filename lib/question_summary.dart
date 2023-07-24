import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: e['selectedAnswer'] != e['answer']
                              ? const Color.fromARGB(255, 20, 20, 20)
                              : Colors.white,
                          foregroundColor: e['selectedAnswer'] != e['answer']
                              ? Colors.white
                              : const Color.fromARGB(255, 20, 20, 20),
                          child: Text(
                            ((e['index'] as int) + 1).toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['question'] as String,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 20, 20, 20),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '你的答案：${e['selectedAnswer'] as String}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 80, 80, 80),
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                '正確答案：${e['answer'] as String}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
