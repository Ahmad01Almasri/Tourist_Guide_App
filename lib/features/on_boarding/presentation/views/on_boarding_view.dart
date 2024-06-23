import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_route_string.dart';
import 'package:tourist_guide/features/on_boarding/presentation/views/functions/on_boarding.dart';

import '../../../../core/functions/navigation.dart';
import 'widgets/custom_nav_bar.dart';
import 'widgets/get_buttons.dart';
import 'widgets/on_boarding_widget_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CustomNavBar(
                onTap: () {
                  onBoardingVisited();
                  customReplacementNavigate(context, AppNamePage.signInPage);
                },
              )),
              SliverToBoxAdapter(
                child: StatefulBuilder(
                  builder: (context, mysetState) {
                    return Column(
                      children: [
                        OnBoardingWidgetBody(
                          onPageChanged: (index) {
                            mysetState(() {
                              currentIndex = index;
                            });
                          },
                          controller: _controller,
                        ),
                        const SizedBox(height: 90),
                        SizedBox(
                          height: 128,
                          child: Column(
                            children: [
                              GetButtons(
                                  currentIndex: currentIndex,
                                  controller: _controller),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
