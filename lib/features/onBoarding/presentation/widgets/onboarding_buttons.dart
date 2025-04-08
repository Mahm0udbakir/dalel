import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/core/utils/cache_keys.dart';
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
          CustomButton(
            text: MyAppStrings.createAccount,
            onPressed: () async {
              await getIt<CacheHelper>()
                  .saveData(key: CacheKeys.onboardingCompleted, value: true);
              navigateWithOutBackButton(context, '/signUp');
            },
          ),
          const SizedBox(height: 17),
          GestureDetector(
            onTap: () async {
              await getIt<CacheHelper>()
                  .saveData(key: CacheKeys.onboardingCompleted, value: true);
              navigateWithOutBackButton(context, '/signIn');
            },
            child: Text(
              MyAppStrings.loginNow,
              style: MyAppTextStyles.poppins300size16.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    } else {
      return CustomButton(
        text: MyAppStrings.next,
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
