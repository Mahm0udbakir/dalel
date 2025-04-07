import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/cutom_nav_bar.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/onboarding_body.dart';
import 'package:dalel/features/onBoarding/presentation/widgets/onboarding_buttons.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
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
              CustomNavBar(
                onTap: () => navigateWithOutBackButton(context, '/signup'),
              ),
              OnBoardingBodyWidget(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _pageController,
              ),
              const SizedBox(height: 88),
              GetOnBoardingButtons(
                  currentIndex: currentIndex, pageController: _pageController),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}

