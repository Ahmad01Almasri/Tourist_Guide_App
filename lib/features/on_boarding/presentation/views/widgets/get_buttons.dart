import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_route_string.dart';
import 'package:tourist_guide/core/utils/app_strings.dart';

import '../../../../../core/functions/navigation.dart';
import '../../../../../core/widgets/custom_button_app.dart';
import '../../../data/models/on_boarding_model.dart';
import '../functions/on_boarding.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return currentIndex == onBoardingData.length - 1
        ? Column(
            children: [
              CustomButtonApp(
                text: AppStrings.createAccount,
                onPressed: () {
                  onBoardingVisited();
                  customReplacementNavigate(context, AppNamePage.signUpPage);
                },
              ),
              const SizedBox(height: 16),
              CustomButtonApp(
                text: AppStrings.youHave,
                onPressed: () {
                  onBoardingVisited();
                  customReplacementNavigate(context, AppNamePage.signInPage);
                },
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(top: 72),
            child: CustomButtonApp(
              text: AppStrings.next,
              onPressed: () {
                controller.nextPage(
                  duration: const Duration(microseconds: 200),
                  curve: Curves.bounceIn,
                );
              },
            ),
          );
  }
}
