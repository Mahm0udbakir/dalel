import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSubTitle extends StatelessWidget {
  const ForgotPasswordSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Text(
        'Enter your registered email below to receive password reset instruction',
        style: MyAppTextStyles.poppins400size16,
        textAlign: TextAlign.center,
      ),
    );
  }
}
