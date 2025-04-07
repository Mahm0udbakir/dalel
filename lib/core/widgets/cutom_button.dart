import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  const CutomButton({super.key, this.color,  required this.text});
  final Color? color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56  ,
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.poppins500size24.copyWith(
            color: AppColors.offWhite,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
