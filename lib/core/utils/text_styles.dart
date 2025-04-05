import 'package:dalel/core/utils/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static final pacifico400size64 = TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: AppColors.deepBrown,
  );
  static const poppins500size24 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
static const poppins300size16 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
}