import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_assets.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';

import '../../../../core/utils/app_strings.dart';

class TopTenResturant extends StatelessWidget {
  const TopTenResturant({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                Assets.imagesOnBoarding,
                height: 220,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      )),
                  const SizedBox(
                    width: 40,
                  ),
                  Text(
                    AppStrings.topTenRestaurant,
                    style: AppTextStyles.poppinsBoldstyle24
                        .copyWith(color: AppColors.white),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        Assets.imagesOnBoarding2,
                                      ))),
                            ),
                          ),
                          Column(
                            children: [Text("RestName")],
                          )
                        ],
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
