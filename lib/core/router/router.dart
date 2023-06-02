import 'package:get/get.dart';
import 'package:kuis/core/bindings/quiz/quiz_binding.dart';
import 'package:kuis/core/bindings/topic/topic_binding.dart';
import 'package:kuis/core/router/router_constant.dart';
import 'package:kuis/presentation/home/page/home_page.dart';
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
          binding: TopicBinding(),
        ),
        GetPage(
          name: RouterConstant.quizPage,
          page: () => const QuizPage(),
          binding: QuizBinding(),
        )
      ];
}
