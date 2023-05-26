import 'package:flutter/material.dart';
import 'package:kuis/core/widget/custom_appbar.dart';

class QuizAppbar extends StatelessWidget implements PreferredSizeWidget {
  const QuizAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 8.0),
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Exit',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        )
      ],
      title: Text(
        'Quiz Page',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
