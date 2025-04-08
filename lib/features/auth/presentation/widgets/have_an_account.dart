
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: text1, style: MyAppTextStyles.poppins400size16),
            TextSpan(
              text: text2,
              style: MyAppTextStyles.poppins400size16
                  .copyWith(color: MyAppColors.lightGrey),
            )
          ],
        ),
      ),
    );
  }
}
