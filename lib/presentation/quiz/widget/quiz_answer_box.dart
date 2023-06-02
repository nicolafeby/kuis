import 'package:flutter/material.dart';

class QuizAnswerBox extends StatelessWidget {
  final String answer;
  const QuizAnswerBox({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
      child: Text(answer),
    );
  }
}
