import 'package:dalel/core/utils/text_styles.dart';
import 'package:dalel/features/onBoarding/data/models/on_boarding_model.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/expanding_dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingBodyWidget extends StatelessWidget {
  const OnBoardingBodyWidget(
      {super.key, required this.controller, this.onPageChanged});
  final PageController controller;
  final ValueChanged? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        onPageChanged: onPageChanged,
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                width: 343,
                height: 290,
                child: Image.asset(onboardingData[index].image),
              ),
              const SizedBox(height: 24),
              ExpandingDotsIndicator(controller: controller),
              const SizedBox(height: 32),
              Text(
                onboardingData[index].title,
                style: AppTextStyles.poppins500size24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text(
                onboardingData[index].description,
                style: AppTextStyles.poppins300size16,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}
