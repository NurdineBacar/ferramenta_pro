import 'package:flutter/material.dart';

class BulletText extends StatelessWidget {
  final String text;
  const BulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text.rich(
        TextSpan(
          text: "• ",
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(text: text, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
