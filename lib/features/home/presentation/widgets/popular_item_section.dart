import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/card_popular_or_all_item.dart';

class PopularItemSection extends StatelessWidget {
  const PopularItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 245),
            child: Text(
              AppStrings.popular,
              style: AppTextStyles.poppins500style24
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardPopularOrAllItem(
                image: AppAssets.imagesOnBoarding1,
                onTap: () {},
                itemName: AppStrings.topTenRestaurant,
              ),
              CardPopularOrAllItem(
                image: AppAssets.imagesOnBoarding,
                onTap: () {},
                itemName: AppStrings.topTenRHotel,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardPopularOrAllItem(
                image: AppAssets.imagesOnBoarding2,
                onTap: () {},
                itemName: AppStrings.topTenRHotel,
              ),
              CardPopularOrAllItem(
                image: AppAssets.imagesOnBoarding,
                onTap: () {},
                itemName: AppStrings.topTenRHotel,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
