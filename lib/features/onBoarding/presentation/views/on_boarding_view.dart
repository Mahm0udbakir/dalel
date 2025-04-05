import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:dalel/core/widgets/cutom_button.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/cutom_nav_bar.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/onboarding_body_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CustomNavBar(),
              OnBoardingBodyWidget(),
              const SizedBox(height: 40),
              const CutomButton(text: AppStrings.next),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
