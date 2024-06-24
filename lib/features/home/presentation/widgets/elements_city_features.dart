import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import 'element_city_feature.dart';

class CityFeatureSection extends StatelessWidget {
  const CityFeatureSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CityFeature(
            onPressed: () {},
            featureName: AppStrings.food,
            featurecolor: AppColors.yellowGold,
            icon: Icons.restaurant,
          ),
          CityFeature(
            featureName: AppStrings.hotel,
            featurecolor: AppColors.purple,
            onPressed: () {},
            icon: Icons.apartment,
          ),
          CityFeature(
            featureName: AppStrings.map,
            featurecolor: AppColors.green,
            icon: Icons.map,
            onPressed: () {},
          ),
          CityFeature(
            featureName: AppStrings.historical,
            featurecolor: AppColors.orange,
            onPressed: () {},
            icon: Icons.castle_outlined,
          ),
        ],
      ),
    );
  }
}
