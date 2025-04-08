import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: MyAppStrings.iHaveAgreeToOur,
                  style: MyAppTextStyles.poppins400size16),
              TextSpan(
                text: MyAppStrings.termsAndCondition,
                style: MyAppTextStyles.poppins400size16
                    .copyWith(decoration: TextDecoration.underline),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: BorderSide(
        color: MyAppColors.grey,
      ),
      value: value,
      activeColor: MyAppColors.primaryColor,
      onChanged: (newValue) {
        setState(() {
          value = newValue!;
        });
      },
    );
  }
}
