import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_assets.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_strings.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';
import 'package:tourist_guide/core/widgets/custom_button_app.dart';

import '../../../../core/widgets/card_popular_or_all_item.dart';
import '../widgets/elements_city_features.dart';
import '../widgets/popular_item_section.dart';
import '../widgets/text_form_search_in_home.dart';
import '../widgets/top_row_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController shearchInCitySelectionController =
      TextEditingController();
  @override
  void dispose() {
    shearchInCitySelectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: TopRowHomeSection(),
              ),
              SliverToBoxAdapter(
                child: CustomTextFormSearchInHome(
                    shearchInCitySelectionController:
                        shearchInCitySelectionController),
              ),
              const SliverToBoxAdapter(child: CityFeatureSection()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CustomButtonApp(
                    onPressed: () {},
                    text: "Time",
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: PopularItemSection(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
