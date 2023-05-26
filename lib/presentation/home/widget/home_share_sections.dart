import 'package:flutter/material.dart';

class HomeShareSections extends StatelessWidget {
  const HomeShareSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildShare(),
        _buildRate(),
      ],
    );
  }

  Widget _buildShare() {
    return const Row(
      children: [
        Icon(
          Icons.share,
          color: Colors.blue,
        ),
        SizedBox(width: 8.0),
        Text('Share'),
      ],
    );
  }

  Widget _buildRate() {
    return const Row(
      children: [
        Icon(Icons.star, color: Colors.orange),
        SizedBox(width: 8.0),
        Text('Rate Us'),
      ],
    );
  }
}
