import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, required this.text, this.style});
  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        text,
        style: style ?? MyAppTextStyles.poppins600size28,
      ),
    );
  }
}
