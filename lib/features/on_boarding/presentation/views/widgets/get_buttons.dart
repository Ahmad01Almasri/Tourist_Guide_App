import 'package:flutter/material.dart';

import '../../../../../core/functions/navigation.dart';
import '../../../../../core/widgets/custom_btn.dart';
import '../../../data/models/on_boarding_model.dart';
import '../functions/on_boarding.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (currentIndex == onBoardingData.length - 1)
            ? Column(
                children: [
                  CustomBtn(
                    text: "createAccount",
                    onPressed: () {
                      onBoardingVisited();
                      customReplacementNavigate(context, "/signUp");
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomBtn(
                    text: "have",
                    onPressed: () {
                      onBoardingVisited();
                      customReplacementNavigate(context, "/signUp");
                    },
                  ),
                ],
              )
            : CustomBtn(
                text: "Next",
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(microseconds: 200),
                    curve: Curves.bounceIn,
                  );
                },
              )
      ],
    );
  }
}
