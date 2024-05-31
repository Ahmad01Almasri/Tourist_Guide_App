import 'package:flutter/material.dart';
import 'package:tourist_guide/core/functions/navigation.dart';
import 'package:tourist_guide/core/utils/app_strings.dart';
import 'package:tourist_guide/core/widgets/button_app.dart';

class CitySelectionPage extends StatefulWidget {
  const CitySelectionPage({super.key});

  @override
  State<CitySelectionPage> createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 128,
                      child: Column(
                        children: [
                          CustomButtonApp(
                            title: AppStrings.exploreNow,
                            onPressed: () {
                              customNavigate(context, "/home");
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
