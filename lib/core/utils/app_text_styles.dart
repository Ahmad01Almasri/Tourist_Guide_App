import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  static final poppins600style64 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
    fontFamily: "Poppins",
  );
  static final poppins400style12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.deepGrey,
    fontFamily: "Poppins",
  );
  static final poppins500style18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
    fontFamily: "Poppins",
  );
  static const poppins500style24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: "Poppins",
  );
  static final poppins500style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.deepBrown,
    fontFamily: "Poppins",
  );
  static const poppins300style16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontFamily: "Poppins",
  );
  static final poppins400style20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.deepBrown,
    fontFamily: "Poppins",
  );
}
