import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_field.dart';

class CustomTextFormSearchInHome extends StatelessWidget {
  final TextEditingController shearchInCitySelectionController;
  const CustomTextFormSearchInHome({
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
