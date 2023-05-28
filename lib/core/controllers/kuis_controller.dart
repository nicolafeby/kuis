import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kuis/core/firebase/loading_status.dart';
import 'package:kuis/core/firebase/references.dart';
import 'package:kuis/core/models/kuis_model.dart';

class QuizPaperController extends GetxController {
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  final allPapers = <QuizPaperModel>[].obs;
  final allPaperImages = <String>[].obs;
  final loadingStatus = LoadingStatus.completed.obs;

  Future<void> getAllPapers() async {
    loadingStatus.value = LoadingStatus.loading;
    try {
      QuerySnapshot<Map<String, dynamic>> data = await quizePaperFR.get();
      final paperList =
          data.docs.map((paper) => QuizPaperModel.fromSnapshot(paper)).toList();
      allPapers.assignAll(paperList);

      // for (var paper in paperList) {
      //   final imageUrl =
      //       await Get.find<FireBaseStorageService>().getImage(paper.title);
      //   paper.imageUrl = imageUrl;
      // }
      allPapers.assignAll(paperList);
      loadingStatus.value = LoadingStatus.completed;
    } catch (e) {
      loadingStatus.value = LoadingStatus.error;
      log(e.toString());
    }
  }

  // void navigatoQuestions(
  //     {required QuizPaperModel paper, bool isTryAgain = false}) {
  //   if (isTryAgain) {
  //     Get.back();
  //     Get.offNamed(RouterConstant.quizPage,
  //         arguments: paper, preventDuplicates: false);
  //   } else {
  //     Get.toNamed(RouterConstant.quizPage, arguments: paper);
  //   }
  // }
}
