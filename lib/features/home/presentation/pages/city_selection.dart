import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';
import 'package:tourist_guide/core/widgets/custom_button_app.dart';
import 'package:tourist_guide/core/widgets/custom_text_field.dart';
import 'package:tourist_guide/features/home/presentation/widgets/smooth_images_indicator.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_route_string.dart';
import '../../../../core/utils/app_strings.dart';
import '../functions/select_city_dialog.dart';
import '../functions/selected_city.dart';

class CitySelectionPage extends StatefulWidget {
  const CitySelectionPage({super.key});

  @override
  _CitySelectionPageState createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;
  TextEditingController shearchController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    shearchController.dispose();
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formstate,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: SmoothImagesIndicator(
                  currentPage: _currentPage,
                  pageController: _pageController,
                )),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      AppStrings.selectCityToExplore,
                      style: AppTextStyles.poppins500style24
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                    child: StatefulBuilder(
                  builder: (context, mysetState) => CustomTextForm(
                    onTap: () async {
                      String? result = await selectCityDialog(
                          context); // Wait for dialog result

                      if (result != null) {
                        mysetState(() {
                          selectedCity = result; // Set selected city
                          shearchController.text =
                              selectedCity; // Update text field with selected city
                        });
                        isSelectedCity();
                        saveCityName();
                      }
                    },
                    readOnly: true,
                    hinttext: AppStrings.cityName,
                    mycontroller: shearchController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return AppStrings.empty;
                      }
                      return null;
                    },
                  ),
                )),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      AppStrings.definitionOfWhatNext,
                      style: AppTextStyles.poppinsw600style14
                          .copyWith(color: AppColors.grey),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 110,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomButtonApp(
                    text: AppStrings.exploreNow,
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        customReplacementNavigate(
                            context, AppNamePage.myBottomNavigationBar);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
