import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';

import '../../../../core/utils/app_text_styles.dart';

class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButtonAuth({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.primaryColor,
      height: 40,
      minWidth: 200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.poppinsBoldstyle16,
      ),
    );
  }
}
