import 'package:flutter/material.dart';
import 'package:kuis/core/router/router_constant.dart';

class TopicButtonTile extends StatelessWidget {
  final String title;
  const TopicButtonTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushReplacementNamed(context, RouterConstant.quizPage),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color(0xFF1F3264),
        ),
        child: ListTile(
          title: Text(title),
          trailing: const RotatedBox(
            quarterTurns: 3,
            child: Icon(Icons.arrow_drop_down, size: 32.0),
          ),
        ),
      ),
    );
  }
}
