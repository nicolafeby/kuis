part of '../injector.dart';

class HelperInjector {
  static Future<void> configureHelperInjector() async {
    sl.registerLazySingleton(() => ApiService());
  }
}
