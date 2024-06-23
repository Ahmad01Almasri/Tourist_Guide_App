import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/on_boarding_model.dart';
import 'custom_smooth_page_indicator.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody(
      {super.key, required this.controller, this.onPageChanged});
  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        physics: const BouncingScrollPhysics(),
        controller: controller,
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 280,
                width: 343,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  image: DecorationImage(
                    image: AssetImage(
                      onBoardingData[index].imagePath,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomSmoothPageIndicator(controller: controller),
              const SizedBox(height: 15),
              Text(
                onBoardingData[index].title,
                style: AppTextStyles.poppins500style24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                onBoardingData[index].subTitle,
                style: AppTextStyles.poppinsw600style14
                    .copyWith(color: AppColors.black.withOpacity(0.7)),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}
