import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final PageController controller = PageController(initialPage: 0);

  RxInt activePage = 0.obs;
  Timer? questionTimeer;
  Timer? indicatorTimer;

  int percentage = 0;

  @override
  void onInit() {
    super.onInit();
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

  void start() {
    indicatorTimer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      percentage = timer.tick;
      log(percentage.toString());
    });
  }

  @override
  void dispose() {
    indicatorTimer?.cancel();
    questionTimeer?.cancel();
    super.dispose();
  }
}
