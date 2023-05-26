import 'package:flutter/material.dart';
import 'package:kuis/core/router/router_constant.dart';
import 'package:kuis/presentation/home/page/home_page.dart';
import 'package:kuis/presentation/quiz/page/quiz_page.dart';
import 'package:kuis/presentation/topic/page/topic_page.dart';

class Router {
  Route generateRouter(Widget page, RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => getPageRoute(settings),
    );
  }

  Widget getPageRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstant.homePage:
        return const HomePage();
      case RouterConstant.topicPage:
        return const TopicPage();
      case RouterConstant.quizPage:
        return const QuizPage();
      default:
        return const HomePage();
    }
  }

  Route? generateAppRoutes(RouteSettings settings) {
    Widget getRoutedWidget = getPageRoute(settings);
    return generateRouter(getRoutedWidget, settings);
  }
}
