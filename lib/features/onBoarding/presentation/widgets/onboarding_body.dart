import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/expanding_dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingBodyWidget extends StatelessWidget {
  OnBoardingBodyWidget({super.key});
  final PageController _indicatorController = PageController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _indicatorController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                width: 343,
                height: 290,
                child: Image.asset(MyAppAssets.assetsImagesFrame1),
              ),
              const SizedBox(height: 24),
              ExpandingDotsIndicator(controller: _indicatorController),
              const SizedBox(height: 32),
              Text(
                "Explore The history with Dalel in a smart way",
                style: AppTextStyles.poppins500size24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              const Text(
                "Using our app’s history libraries you can find many historical periods ",
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
