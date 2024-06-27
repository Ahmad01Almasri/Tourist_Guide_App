import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'custom_text_field.dart';

class CustomTextFormSearch extends StatelessWidget {
  final TextEditingController shearchInCitySelectionController;
  const CustomTextFormSearch({
    required this.shearchInCitySelectionController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: CustomTextForm(
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.black,
        ),
        suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_voice,
              color: AppColors.black,
            )),
        hinttext: AppStrings.search,
        mycontroller: shearchInCitySelectionController,
      ),
    );
  }
}
