import 'package:flutter/material.dart';
import 'package:kuis/core/router/router_constant.dart';
import 'package:kuis/core/widget/custom_button.dart';
import 'package:kuis/core/widget/custom_outlined_button.dart';

class HomeButtonSections extends StatelessWidget {
  const HomeButtonSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomButton(
            width: MediaQuery.of(context).size.width / 1.4,
            title: 'PLAY',
            onTap: () {},
          ),
          const SizedBox(height: 16.0),
          CustomOutlinedButton(
            width: MediaQuery.of(context).size.width / 1.4,
            title: 'TOPICS',
            onTap: () => Navigator.pushNamed(context, RouterConstant.topicPage),
          )
        ],
      ),
    );
  }
}
