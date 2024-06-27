import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';

class CardPopularOrAllItem extends StatelessWidget {
  final String itemName;
  final String image;
  void Function()? onTap;
  CardPopularOrAllItem(
      {super.key,
      required this.itemName,
      required this.onTap,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: AppColors.black38,
      onTap: onTap,
      child: Container(
        height: 230,
        width: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 130),
            //   child: IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //           color: AppColors.white,
            //           size: 30,
            //           Icons.favorite_border_outlined)),
            // ),
            // const SizedBox(
            //   height: 110,
            // ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                itemName,
                softWrap: true,
                style: AppTextStyles.poppinsBoldstyle24
                    .copyWith(color: AppColors.offWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
