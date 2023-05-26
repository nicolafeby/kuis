import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.color = Colors.blueAccent,
    this.margin,
  });

  final Function()? onTap;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 47.0,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 12.0),
          backgroundColor: color,
          disabledBackgroundColor: Colors.grey[500],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: onTap == null ? Colors.grey[600] : Colors.white,
              ),
        ),
      ),
    );
  }
}
