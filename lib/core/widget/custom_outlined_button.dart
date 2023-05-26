import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    required this.title,
    required this.onTap,
    this.colorTitle,
    this.width = double.infinity,
    super.key,
  });

  final Color? colorTitle;
  final VoidCallback onTap;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.0,
      width: width,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          side: const BorderSide(
            color: Colors.blueAccent,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: colorTitle ?? Colors.blue,
              ),
        ),
      ),
    );
  }
}
