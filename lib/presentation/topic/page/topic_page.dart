import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuis/core/firebase/loading_status.dart';
import 'package:kuis/core/widget/custom_appbar.dart';
import 'package:kuis/presentation/topic/controllers/topic_controller.dart';
import 'package:kuis/presentation/topic/widget/topic_button_tile.dart';

class TopicPage extends GetView<TopicController> {
  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    TopicController topicController = Get.find();
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(topicController),
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

  Widget _buildBody(TopicController topicController) {
    return Obx(
      () {
        if (topicController.loadingStatus.value == LoadingStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: topicController.allTopic.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 12.0);
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => topicController.navigatoQuestions(
                paper: topicController.allTopic[index],
              ),
              child: TopicButtonTile(
                title: topicController.allTopic[index].title,
              ),
            );
          },
        );
      },
    );
  }
}
