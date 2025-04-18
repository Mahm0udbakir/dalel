  import 'package:dalel/core/utils/assets.dart';
  import 'package:dalel/core/utils/strings.dart';
  import 'package:dalel/core/utils/text_styles.dart';
  import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
  import 'package:flutter/material.dart';

  class CustomHomeViewAppBar extends StatelessWidget {
    const CustomHomeViewAppBar({super.key});

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(MyAppAssets.assetsImagesMenu),
              CustomTextWidget(
                text: MyAppStrings.appName,
                style: MyAppTextStyles.pacifico400size30,
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      );
    }
  }
