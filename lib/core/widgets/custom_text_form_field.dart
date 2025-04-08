import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.keyboardType, required this.text});
  final TextInputType? keyboardType;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        style: MyAppTextStyles.poppins300size16,
        cursorColor: MyAppColors.primaryColor,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: MyAppTextStyles.poppins500size16,
          floatingLabelStyle: MyAppTextStyles.poppins500size16,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    color: MyAppColors.grey,
  ),
);
