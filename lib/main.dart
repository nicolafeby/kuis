import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuis/core/router/router.dart' as router;

import 'injector/injector.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
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
    return MaterialApp(
      theme: _buildTheme(Brightness.dark),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.Router().generateAppRoutes,
    );
  }
}
