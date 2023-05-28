import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuis/core/controllers/kuis_controller.dart';
import 'package:kuis/core/firebase/loading_status.dart';
import 'package:kuis/core/widget/custom_appbar.dart';
import 'package:kuis/presentation/topic/widget/topic_button_tile.dart';

class TopicPage extends GetView {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuizPaperController quizController = Get.find();
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(quizController),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        'Topics',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  Widget _buildBody(QuizPaperController quizController) {
    return Obx(
      () => quizController.loadingStatus.value == LoadingStatus.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: quizController.allPapers.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 12.0);
              },
              itemBuilder: (BuildContext context, int index) {
                return TopicButtonTile(
                  title: quizController.allPapers[index].title,
                  model: quizController.allPapers[index],
                );
              },
            ),
    );
  }
}
