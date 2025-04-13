
import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomForgotPassword extends StatelessWidget {
  const CustomForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          navigateWithBackButton(context, '/forgetPassword');
        },
        child: Text(
          MyAppStrings.forgotPassword,
          style: MyAppTextStyles.poppins600size28.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
