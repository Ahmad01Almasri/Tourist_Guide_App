import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class TopNotifcationBar extends StatelessWidget {
  const TopNotifcationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          AppStrings.notifications,
          style: AppTextStyles.poppinsBoldstyle18.copyWith(
            color: AppColors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
