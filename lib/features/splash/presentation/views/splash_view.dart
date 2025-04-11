import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/core/utils/cache_keys.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    bool isOnboardingCompleted =
        getIt<CacheHelper>().getData(key: CacheKeys.onboardingCompleted) ??
            false;
    if (isOnboardingCompleted) {
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigate(context, '/signIn')
          : delayedNavigate(context, '/home');
    } else {
      delayedNavigate(context, '/onBoarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Dalel',
          style: MyAppTextStyles.pacifico400size64,
        ),
      ),
    );
  }
}

void delayedNavigate(context, path) {
  Future.delayed(const Duration(seconds: 2), () {
    navigateWithOutBackButton(context, path);
  });
}
