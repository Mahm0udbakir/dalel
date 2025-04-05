import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delayedNavigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Dalel',
          style: AppTextStyles.pacifico400size64,
        ),
      ),
    );
  }
}

void delayedNavigate(context) {
  Future.delayed(const Duration(seconds: 2), () {
    navigate(context, '/onboarding');
  });
}
    