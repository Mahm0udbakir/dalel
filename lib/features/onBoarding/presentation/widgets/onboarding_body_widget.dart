import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:dalel/core/widgets/cutom_button.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/cutom_nav_bar.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/expanding_dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingBodyWidget extends StatelessWidget {
  OnBoardingBodyWidget({super.key});
  final PageController _indicatorController = PageController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _indicatorController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(MyAppAssets.assetsImagesFrame1),
                const SizedBox(height: 24),
                ExpandingDotsIndicator(controller: _indicatorController),
                const SizedBox(height: 32),
                const Text(
                  "Explore The history with Dalel in a smart way",
                  style: AppTextStyles.poppins500size24,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Using our app’s history libraries you can find many historical periods ",
                  style: AppTextStyles.poppins300size16,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
