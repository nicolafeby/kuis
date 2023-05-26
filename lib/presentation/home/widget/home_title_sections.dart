import 'package:flutter/material.dart';
import 'package:kuis/core/utils/app_constants.dart';

class HomeTitleSections extends StatelessWidget {
  const HomeTitleSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImage(),
        Text(
          'Flutter Quiz App',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Image.asset(
      AssetConstant.imgLamp,
      height: 150.0,
      width: 150.0,
    );
  }
}
