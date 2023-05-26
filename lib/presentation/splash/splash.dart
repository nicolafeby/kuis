import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kuis/core/router/router_constant.dart';
import 'package:kuis/core/utils/app_constants.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
        context,
        RouterConstant.homePage,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AssetConstant.lotQuiz,
          height: 250,
        ),
      ),
    );
  }
}
