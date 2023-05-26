import 'package:flutter/material.dart';
import 'package:kuis/presentation/home/widget/home_button_sections.dart';
import 'package:kuis/presentation/home/widget/home_share_sections.dart';
import 'package:kuis/presentation/home/widget/home_title_sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTitleSections(),
        const SizedBox(height: 64.0),
        _buildButtonSections(),
        const SizedBox(height: 32.0),
        _buildShareSections(),
      ],
    );
  }

  Widget _buildButtonSections() {
    return const HomeButtonSections();
  }

  Widget _buildShareSections() {
    return const HomeShareSections();
  }

  Widget _buildTitleSections() {
    return const HomeTitleSections();
  }
}
