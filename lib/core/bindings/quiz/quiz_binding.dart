import 'package:get/get.dart';
import 'package:kuis/presentation/quiz/controller/quiz_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(
      () => QuizController(),
    );
  }
}
