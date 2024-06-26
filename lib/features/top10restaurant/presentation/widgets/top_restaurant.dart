import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class TopRestaurantBar extends StatelessWidget {
  const TopRestaurantBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              AppAssets.restaurant,
              height: 220,
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Text(
                  AppStrings.topTenRestaurant,
                  style: AppTextStyles.poppinsBoldstyle24.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
