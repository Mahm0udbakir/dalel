import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:dalel/core/widgets/cutom_button.dart';
import 'package:dalel/features/onBoarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class GetOnBoardingButtons extends StatelessWidget {
  const GetOnBoardingButtons(
      {super.key, required this.currentIndex, required this.pageController});
  final int currentIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onboardingData.length - 1) {
      return Column(
        children: [
          CutomButton(
            text: AppStrings.createAccount,
            onPressed: () {
              navigateWithOutBackButton(context, '/signup');
            },
          ),
          const SizedBox(height: 17),
          GestureDetector(
            onTap: () {
              navigateWithOutBackButton(context, '/signin');
            },
            child: Text(
              AppStrings.loginNow,
              style: AppTextStyles.poppins300size16.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    } else {
      return CutomButton(
        text: AppStrings.next,
        onPressed: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
      );
    }
  }
}
