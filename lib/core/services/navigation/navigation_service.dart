import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<void> navigateAndReplace(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static Future<void> navigate(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static BuildContext getContext() {
    return navigatorKey.currentContext!;
  }
}
