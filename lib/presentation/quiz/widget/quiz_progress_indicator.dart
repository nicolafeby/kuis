import 'package:flutter/material.dart';

class LinearTimeIndicator extends StatelessWidget {
  final double value;
  const LinearTimeIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value / 30000,
      backgroundColor: const Color(0xFF30486a),
      color: const Color(0xFFf7d28e),
    );
  }
}
