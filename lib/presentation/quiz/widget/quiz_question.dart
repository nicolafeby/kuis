import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuis/core/models/kuis_model.dart';
import 'package:kuis/presentation/quiz/widget/quiz_answer_box.dart';

class QuizQuestion extends StatelessWidget {
  final String question;
  final List<Answer> answer;
  const QuizQuestion({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    log("ini list jawaban ${answer.length}");
    return Column(
      children: [
        Text(question),
        const SizedBox(height: 24.0),
        Wrap(
          spacing: 12.0,
          children: List.generate(
            answer.length,
            (index) => QuizAnswerBox(
              answer: answer[index].identifier.toString(),
            ),
          ),
        )
      ],
    );
  }
}
