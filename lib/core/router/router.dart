import 'package:get/get.dart';
import 'package:kuis/core/controllers/kuis_controller.dart';
import 'package:kuis/core/router/router_constant.dart';
import 'package:kuis/presentation/home/page/home_page.dart';
import 'package:kuis/presentation/quiz/controller/quiz_controller.dart';
import 'package:kuis/presentation/quiz/page/quiz_page.dart';
import 'package:kuis/presentation/splash/splash.dart';
import 'package:kuis/presentation/topic/page/topic_page.dart';

class AppRoutes {
  static List<GetPage> pages() => [
        GetPage(
          page: () => const SplashScreen(),
          name: RouterConstant.splash,
        ),
        GetPage(
          page: () => const HomePage(),
          name: RouterConstant.homePage,
        ),
        GetPage(
          page: () => const TopicPage(),
          name: RouterConstant.topicPage,
          binding: BindingsBuilder(() {
            Get.put(QuizPaperController());
            // Get.put(MyDrawerController());
          }),
        ),
        GetPage(
          name: RouterConstant.quizPage,
          page: () => QuizPage(),
          binding: BindingsBuilder(() {
            Get.put(QuizController());
          }),
        )
      ];
}



// import 'package:flutter/material.dart';
// import 'package:kuis/core/router/router_constant.dart';
// import 'package:kuis/presentation/home/page/home_page.dart';
// import 'package:kuis/presentation/quiz/page/quiz_page.dart';
// import 'package:kuis/presentation/splash/splash.dart';
// import 'package:kuis/presentation/topic/page/topic_page.dart';

// class Router {
//   Route generateRouter(Widget page, RouteSettings settings) {
//     return MaterialPageRoute(
//       settings: settings,
//       builder: (context) => getPageRoute(settings),
//     );
//   }

//   Widget getPageRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RouterConstant.homePage:
//         return const HomePage();
//       case RouterConstant.topicPage:
//         return const TopicPage();
//       case RouterConstant.quizPage:
//         return const QuizPage();
//       default:
//         return const SplashScreen();
//     }
//   }

//   Route? generateAppRoutes(RouteSettings settings) {
//     Widget getRoutedWidget = getPageRoute(settings);
//     return generateRouter(getRoutedWidget, settings);
//   }
// }
