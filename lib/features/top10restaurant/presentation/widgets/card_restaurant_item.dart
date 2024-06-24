import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CardRestaurantItem extends StatelessWidget {
  const CardRestaurantItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppAssets.imagesOnBoarding2,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "RestName",
                    style: AppTextStyles.poppinsThinW6000style22,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Modern European",
                    style: AppTextStyles.poppinsW500style16,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "4.7",
                        style: AppTextStyles.poppinsW500style16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      RatingBarIndicator(
                        rating: 4.5,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.black38,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left:
                                  4.0), // إضافة padding لترك مسافة صغيرة بين الأيقونة والنص
                          child: Text(
                            "almerdaan, SDFSDF SFSDF ",
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: AppTextStyles.poppinsW500style16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  color: AppColors.black,
                  size: 30,
                  Icons.favorite_border_outlined,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  color: AppColors.black,
                  size: 30,
                  Icons.add,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
