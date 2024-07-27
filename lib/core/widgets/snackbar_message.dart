import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';

class SnackBarMessage {
  void showSuccessSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.poppinsBoldstyle16,
        ),
        backgroundColor: AppColors.green,
      ),
    );
  }

  void showErrorSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.poppinsBoldstyle16,
        ),
        backgroundColor: AppColors.red,
      ),
    );
  }
}
