import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kuis/core/firebase/loading_status.dart';
import 'package:kuis/core/firebase/references.dart';
import 'package:kuis/core/models/kuis_model.dart';

class QuizController extends GetxController {
  RxInt activePage = 0.obs;
  final allQuestion = <Question>[];
  final PageController controller = PageController(initialPage: 0);
  Timer? indicatorTimer;
  final loadingStatus = LoadingStatus.completed.obs;
  RxInt percentage = 0.obs;
  Timer? questionTimeer;

  @override
  void dispose() {
    indicatorTimer?.cancel();
    questionTimeer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    // start();
    questionTimeer = Timer.periodic(
      const Duration(seconds: 30),
      (timer) {
        if (activePage < 5) {
          activePage++;
        } else {
          activePage.value = 0;
        }
        controller.animateToPage(
          activePage.value,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      },
    );

    controller.addListener(() {
      activePage.value = controller.page!.toInt();
      indicatorTimer?.cancel();
      start();
    });
  }

  @override
  void onReady() {
    final quizePaprer = Get.arguments as QuizModel;
    log("ini ${quizePaprer.questions}");
    getAllQuestion(quizePaprer);
    super.onReady();
  }

  Future<void> getAllQuestion(QuizModel quizPaper) async {
    try {
      loadingStatus.value = LoadingStatus.loading;
      final QuerySnapshot<Map<String, dynamic>> questionsQuery =
          await quizePaperFR.doc(quizPaper.id).collection('questions').get();
      final questions = questionsQuery.docs
          .map((question) => Question.fromSnapshot(question))
          .toList();
      quizPaper.questions = questions;
      for (Question question in quizPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await quizePaperFR
                .doc(quizPaper.id)
                .collection('questions')
                .doc(question.id)
                .collection('answers')
                .get();
        final answers = answersQuery.docs
            .map((answer) => Answer.fromSnapshot(answer))
            .toList();
        question.answers = answers;
      }
    } on Exception catch (e) {
      log(e.toString());
      loadingStatus.value = LoadingStatus.error;
    } catch (e) {
      loadingStatus.value = LoadingStatus.error;
      log(e.toString());
    }
    // log("ini datanya ${quizPaper.questions}");
    if (quizPaper.questions != null && quizPaper.questions!.isNotEmpty) {
      allQuestion.assignAll(quizPaper.questions!);

      // currentQuestion.value = quizPaper.questions![0];
      loadingStatus.value = LoadingStatus.completed;
    } else {
      loadingStatus.value = LoadingStatus.noReult;
    }
  }

  void start() {
    indicatorTimer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      percentage = timer.tick.obs;
      log(percentage.toString());
    });
  }
}

// import 'dart:async';
// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kuis/core/firebase/loading_status.dart';
// import 'package:kuis/core/firebase/references.dart';
// import 'package:kuis/core/models/kuis_model.dart';

// class QuizController extends GetxController {
//   final loadingStatus = LoadingStatus.loading.obs;
//   final PageController controller = PageController(initialPage: 0);
//   late QuizModel quizModel;
//   final allQuestions = <Question>[];

//   RxInt activePage = 0.obs;
//   Timer? questionTimeer;
//   Timer? indicatorTimer;

//   int percentage = 0;

//   @override
//   void onReady() {
//     final quiz = Get.arguments as QuizModel;
//     loadData(quiz);
//     super.onReady();
//   }

//   void loadData(QuizModel quizPaper) async {
//     quizModel = quizPaper;
//     loadingStatus.value = LoadingStatus.loading;
//     try {
//       final QuerySnapshot<Map<String, dynamic>> questionsQuery =
//           await quizePaperFR.doc(quizPaper.id).collection('questions').get();
//       final questions = questionsQuery.docs
//           .map((question) => Question.fromSnapshot(question))
//           .toList();
//       quizPaper.questions = questions;
//       for (Question question in quizPaper.questions!) {
//         final QuerySnapshot<Map<String, dynamic>> answersQuery =
//             await quizePaperFR
//                 .doc(quizPaper.id)
//                 .collection('questions')
//                 .doc(question.id)
//                 .collection('answers')
//                 .get();
//         final answers = answersQuery.docs
//             .map((answer) => Answer.fromSnapshot(answer))
//             .toList();
//         question.answers = answers;
//       }
//     } on Exception {
//       loadingStatus.value = LoadingStatus.error;
//     } catch (e) {
//       loadingStatus.value = LoadingStatus.error;
//       log(e.toString());
//     }

//     if (quizPaper.questions != null && quizPaper.questions!.isNotEmpty) {
//       allQuestions.assignAll(quizPaper.questions!);
//       currentQuestion.value = quizPaper.questions![0];
//       loadingStatus.value = LoadingStatus.completed;
//     } else {
//       loadingStatus.value = LoadingStatus.noReult;
//     }
//   }

//   Rxn<Question> currentQuestion = Rxn<Question>();

//   @override
//   void onInit() {
//     super.onInit();
//     final quiz = Get.arguments as QuizModel;
//     quizModel = quiz;
//     questionTimeer = Timer.periodic(
//       const Duration(seconds: 30),
//       (timer) {
//         if (activePage < 5) {
//           activePage++;
//         } else {
//           activePage.value = 0;
//         }
//         controller.animateToPage(
//           activePage.value,
//           duration: const Duration(milliseconds: 200),
//           curve: Curves.easeIn,
//         );
//       },
//     );

//     controller.addListener(() {
//       activePage.value = controller.page!.toInt();
//       indicatorTimer?.cancel();
//       start();
//     });
//   }

//   void start() {
//     indicatorTimer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
//       percentage = timer.tick;
//       log(percentage.toString());
//     });
//   }

//   @override
//   void dispose() {
//     indicatorTimer?.cancel();
//     questionTimeer?.cancel();
//     controller.dispose();
//     super.dispose();
//   }
// }
