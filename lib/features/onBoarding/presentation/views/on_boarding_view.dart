import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'OnBoarding',
          style: AppTextStyles.pacifico400size64,
        ),
      ),
    );
  }
}
