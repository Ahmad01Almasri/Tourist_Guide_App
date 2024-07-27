import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class TopAllItemBar extends StatelessWidget {
  final String? topText;
  final String image;
  final Color? iconAndTextColor;
  final double? topPadding;
  final double? leftPadding;
  const TopAllItemBar({
    super.key,
    this.topText,
    required this.image,
    this.iconAndTextColor,
    this.topPadding,
    this.leftPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              image,
              height: 220,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: leftPadding ?? 5, top: topPadding ?? 12),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      size: 35,
                      Icons.arrow_back,
                      color: iconAndTextColor ?? AppColors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 5),
                  child: Text(
                    topText ?? "",
                    style: AppTextStyles.poppinsBoldstyle24.copyWith(
                        color: iconAndTextColor ?? AppColors.black,
                        fontSize: 25),
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
