import 'package:flutter/material.dart';
import 'package:tourist_guide/core/widgets/custom_button_app.dart';
import '../widgets/elements_city_features.dart';
import '../widgets/popular_item_section.dart';
import '../../../../core/widgets/text_form_search.dart';
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
                child: CustomTextFormSearch(
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
              const SliverToBoxAdapter(
                child: PopularItemSection(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
