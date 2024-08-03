import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

List<String> cityName = [
  'Aleppo',
  'Deir-ez-Zor',
  'Damascus',
  'Homs',
  'Hama',
  'Hasakah',
  'Latakia',
  'Idlib',
  'Raqqa',
  'Quneitra',
  'Tartus',
  'Daraa',
  'As-Suwayda',
  'Rif-Dimashq'
];
String selectedCity = '';
Future<dynamic> selectCityDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: Border.all(color: AppColors.primaryColor, width: 5),
      title: Icon(
        Icons.location_on_sharp,
        color: AppColors.primaryColor,
        size: 45,
      ),
      actions: const [
        SizedBox(
          height: 105,
        )
      ],
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            items: cityName.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style:
                      AppTextStyles.poppinsW500style15.copyWith(fontSize: 20),
                ),
              );
            }).toList(),
            hint: Text(
              AppStrings.selectCityName,
              style: AppTextStyles.poppinsW500style15.copyWith(fontSize: 20),
            ),
            onChanged: (value) {
              selectedCity = value!;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  ).then((value) => selectedCity);
}
