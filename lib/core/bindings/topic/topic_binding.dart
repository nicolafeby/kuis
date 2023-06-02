import 'package:get/get.dart';
import 'package:kuis/presentation/topic/controllers/topic_controller.dart';

class TopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopicController>(
      () => TopicController(),
    );
  }
}
