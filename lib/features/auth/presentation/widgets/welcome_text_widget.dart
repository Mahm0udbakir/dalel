import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: Text(
        MyAppStrings.welcome,
        style: MyAppTextStyles.poppins600size28,
      ),
    );
  }
}