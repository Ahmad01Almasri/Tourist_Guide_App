import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class SmoothImagesIndicator extends StatelessWidget {
  final List<String> images;
  final PageController pageController;
  final int currentPage;
  final bool isImagesNetwork;
  const SmoothImagesIndicator(
      {super.key,
      required this.pageController,
      required this.currentPage,
      required this.images,
      required this.isImagesNetwork});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 0, right: 0, left: 0),
            child: SizedBox(
              height: 270,
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return isImagesNetwork
                      ? Image.network(
                          images[index],
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          images[index],
                          fit: BoxFit.fill,
                        );
                },
              ),
            )),
        const SizedBox(
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
