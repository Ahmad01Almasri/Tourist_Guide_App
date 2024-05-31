import 'package:flutter/material.dart';
import 'dart:async';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class SmoothImagesIndicator extends StatelessWidget {
  final PageController pageController;
  final int currentPage;

  const SmoothImagesIndicator(
      {super.key, required this.pageController, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: SizedBox(
              height: 250,
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                double selected = 0.0;
                if (pageController.page != null) {
                  selected = pageController.page! - index;
                } else {
                  selected = (currentPage - index).toDouble();
                }
                selected =
                    (1 - (selected.abs().clamp(0.0, 1.0))).clamp(0.0, 1.0);

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: selected > 0.5
                        ? AppColors.primaryColor
                        : AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

final List<String> images = [
  Assets.imagesOnBoarding,
  Assets.imagesOnBoarding1,
  Assets.imagesOnBoarding2,
];
