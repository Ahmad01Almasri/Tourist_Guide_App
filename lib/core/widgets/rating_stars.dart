import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/app_colors.dart';

class MyRatingBarIndicator extends StatelessWidget {
  const MyRatingBarIndicator({
    super.key,
    required this.itemRate,
    required this.itemSize,
  });
  final double itemSize;
  final double itemRate;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: itemRate,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: AppColors.yellowGold,
      ),
      itemCount: 5,
      itemSize: itemSize,
      direction: Axis.horizontal,
    );
  }
}
