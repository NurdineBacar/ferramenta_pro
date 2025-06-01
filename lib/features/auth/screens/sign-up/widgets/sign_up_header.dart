import 'package:flutter/material.dart';
import 'package:project/utils/constants/text_string.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppTextConst.signUpTitle1,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: 15),
        Text(
          AppTextConst.signUpSubTitle1,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
