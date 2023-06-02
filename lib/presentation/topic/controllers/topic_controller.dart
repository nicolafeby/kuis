import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kuis/core/firebase/loading_status.dart';
import 'package:kuis/core/firebase/references.dart';
import 'package:kuis/core/models/kuis_model.dart';
import 'package:kuis/core/router/router_constant.dart';

class TopicController extends GetxController {
  @override
  void onReady() {
    getAllTopic();
    super.onReady();
  }

  final allTopic = <QuizModel>[].obs;
  final loadingStatus = LoadingStatus.completed.obs;

  Future<void> getAllTopic() async {
    loadingStatus.value = LoadingStatus.loading;
    try {
      QuerySnapshot<Map<String, dynamic>> data = await quizePaperFR.get();
      final paperList =
          data.docs.map((paper) => QuizModel.fromSnapshot(paper)).toList();
      allTopic.assignAll(paperList);
      loadingStatus.value = LoadingStatus.completed;
    } catch (e) {
      loadingStatus.value = LoadingStatus.error;
      log(e.toString());
    }
  }

  void navigatoQuestions({required QuizModel paper}) {
    Get.toNamed(RouterConstant.quizPage, arguments: paper);
  }
}
