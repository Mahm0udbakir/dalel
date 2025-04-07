import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/widgets/cutom_button.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/cutom_nav_bar.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 40),
              const CustomNavBar(),
              OnBoardingBodyWidget(
                controller: _pageController,
              ),
              const SizedBox(height: 88),
              CutomButton(
                text: AppStrings.next,
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                },
              ),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
