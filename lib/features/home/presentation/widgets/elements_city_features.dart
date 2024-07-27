import 'package:flutter/material.dart';
import 'package:tourist_guide/core/functions/navigation.dart';
import 'package:tourist_guide/core/utils/app_route_string.dart';

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
            onPressed: () {
              customNavigate(context, AppNamePage.allRestaurant);
            },
            featureName: AppStrings.restaurant,
            featurecolor: AppColors.yellowGold,
            icon: Icons.restaurant,
          ),
          CityFeature(
            featureName: AppStrings.hotel,
            featurecolor: AppColors.purple,
            onPressed: () {
              customNavigate(context, AppNamePage.allHotel);
            },
            icon: Icons.apartment,
          ),
          CityFeature(
            featureName: AppStrings.favorite,
            featurecolor: AppColors.red,
            icon: Icons.favorite,
            onPressed: () {
              customNavigate(context, AppNamePage.favorite);
            },
          ),
          CityFeature(
            featureName: AppStrings.historical,
            featurecolor: AppColors.orange,
            onPressed: () {
              customNavigate(context, AppNamePage.allHistorical);
            },
            icon: Icons.castle_outlined,
          ),
        ],
      ),
    );
  }
}
