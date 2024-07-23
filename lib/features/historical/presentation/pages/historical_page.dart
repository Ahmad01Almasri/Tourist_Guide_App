import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';
import 'package:tourist_guide/core/widgets/custom_button_app.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../../core/widgets/text_form_search.dart';
import '../../../home/presentation/widgets/popular_item_section.dart';

class HistoricalPage extends StatefulWidget {
  const HistoricalPage({super.key});

  @override
  State<HistoricalPage> createState() => _ALlRestaurantPageState();
}

class _ALlRestaurantPageState extends State<HistoricalPage> {
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.black,
                          size: 35,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        AppStrings.food,
                        style: AppTextStyles.poppinsBoldstyle24
                            .copyWith(fontSize: 30),
                      ),
                      const Spacer(flex: 2), // Flex value to balance space
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextFormSearch(
                    shearchInCitySelectionController:
                        shearchInCitySelectionController),
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
