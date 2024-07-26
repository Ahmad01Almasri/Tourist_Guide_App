import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';

class DescriptionSection extends StatelessWidget {
  final String description;
  const DescriptionSection({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 230, top: 20),
          child: Text(
            AppStrings.description,
            style: AppTextStyles.poppinsW500style16
                .copyWith(fontSize: 20, color: AppColors.primaryColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            description,
            style: AppTextStyles.poppinsW500style16.copyWith(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
