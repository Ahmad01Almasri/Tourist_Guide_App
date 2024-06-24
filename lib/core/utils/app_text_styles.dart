import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  static final poppins600style40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
  static final poppins400style12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.deepGrey,
  );
  static final poppinsBoldstyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static final poppinsBoldstyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static final poppins500style24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static final poppinsw600style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static final poppins600style12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.red.withOpacity(0.7),
  );

  static final poppinsBoldstyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final poppinsW500style16 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.black38,
  );

  static final poppins400style20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.deepBrown,
  );
  static final poppinsW500style15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static final poppinsThinW6000style22 = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontFamily: "Poppins-Thin.ttf");
}
