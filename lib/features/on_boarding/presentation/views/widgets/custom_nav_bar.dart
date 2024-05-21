import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_strings.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.primaryColor,
          child: Text(
            AppStrings.skip,
            style: AppTextStyles.poppins300style16,
          ),
        ),
      ),
    );
  }
}
