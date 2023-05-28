import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuis/presentation/quiz/widget/quiz_appbar.dart';
import 'package:kuis/presentation/quiz/widget/quiz_progress_indicator.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final PageController _controller = PageController(initialPage: 0);

  int _activePage = 0;
  Timer? _questionTimeer;
  Timer? _indicatorTimer;

  int percentage = 0;

  @override
  void initState() {
    super.initState();
    start();

    _questionTimeer = Timer.periodic(
      const Duration(seconds: 15),
      (timer) {
        if (_activePage < 5) {
          _activePage++;
        } else {
          _activePage = 0;
        }
        _controller.animateToPage(
          _activePage,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      },
    );

    _controller.addListener(() {
      setState(() {
        _activePage = _controller.page!.toInt();
        _indicatorTimer?.cancel();
        start();
      });
    });
  }

  void start() {
    _indicatorTimer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setState(() {
        percentage = timer.tick;
        log(percentage.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildPageView(),
    );
  }

  @override
  void dispose() {
    _questionTimeer?.cancel();
    _indicatorTimer?.cancel();
    super.dispose();
  }

  PreferredSizeWidget _buildAppbar() => const QuizAppbar();

  Widget _buildPageView() {
    return Column(
      children: [
        LinearTimeIndicator(
          value: percentage.toDouble(),
        ),
        Expanded(
          child: PageView.builder(
            onPageChanged: (int page) {
              _activePage = page;
            },
            controller: _controller,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  _activePage.toString(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
