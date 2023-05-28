import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuis/core/router/router.dart';

import 'injector/injector.dart' as di;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      // textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      scaffoldBackgroundColor: const Color(0xFF1A284c),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(
          0xFF1A284c,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: _buildTheme(Brightness.dark),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages(),
    );
  }
}
