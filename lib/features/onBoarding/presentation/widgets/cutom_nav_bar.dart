import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        AppStrings.skip,
        style: AppTextStyles.poppins300size16.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
