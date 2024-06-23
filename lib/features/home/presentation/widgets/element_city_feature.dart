import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CityFeature extends StatelessWidget {
  final String featureName;
  final Color featurecolor;
  final IconData? icon;
  final void Function()? onPressed;
  const CityFeature({
    super.key,
    required this.featureName,
    required this.featurecolor,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(featurecolor),
                shape: const MaterialStatePropertyAll(CircleBorder())),
            onPressed: onPressed,
            child: Icon(
              icon,
              color: AppColors.white,
              size: 30,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          featureName,
          style: AppTextStyles.poppinsBoldstyle16.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
