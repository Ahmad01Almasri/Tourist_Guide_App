import 'package:flutter/material.dart';

import '../widgets/elements_city_features.dart';
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
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextFormSearchInHome(
                    shearchInCitySelectionController:
                        shearchInCitySelectionController),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              const SliverToBoxAdapter(child: AllCityFeatureSection()),
            ],
          ),
        ),
      ),
    );
  }
}
