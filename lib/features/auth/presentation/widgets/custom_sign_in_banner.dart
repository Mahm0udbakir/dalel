import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomSignInBanner extends StatelessWidget {
  const CustomSignInBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      color: MyAppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            MyAppStrings.appName,
            style: MyAppTextStyles.saira700size32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(MyAppAssets.assetsImagesVector1),
              const SizedBox(width: 20),
              Image.asset(MyAppAssets.assetsImagesVector2),
            ],
          ),
        ],
      ),
    );
  }
}
