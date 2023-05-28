import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuis/core/controllers/kuis_controller.dart';
import 'package:kuis/core/models/kuis_model.dart';
import 'package:kuis/core/router/router_constant.dart';

class TopicButtonTile extends GetView<QuizPaperController> {
  final String title;
  final QuizPaperModel model;
  const TopicButtonTile({super.key, required this.title, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.pushNamed(context, RouterConstant.quizPage),
      onTap: () => Get.toNamed(RouterConstant.quizPage, arguments: model),
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
