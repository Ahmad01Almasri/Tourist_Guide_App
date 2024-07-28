import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../../../core/utils/app_route_string.dart';
import '../functions/selected_city.dart';

Future<void> showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // User must tap a button to confirm or cancel
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirm Logout',
          style: AppTextStyles.poppinsThinW6000style22,
        ),
        content: Text(
          'Are you sure you want to log out?',
          style:
              AppTextStyles.poppinsBoldstyle18.copyWith(color: AppColors.black),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        AppColors.black38.withOpacity(0.7))),
                child: Text('Cancel',
                    style: AppTextStyles.poppinsBoldstyle16
                        .copyWith(color: AppColors.primaryColor)),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        AppColors.black38.withOpacity(0.7))),
                child: Text('Log Out',
                    style: AppTextStyles.poppinsBoldstyle16
                        .copyWith(color: AppColors.primaryColor)),
                onPressed: () {
                  // Execute logout actions here
                  SharedPreferencesService.deleteToken();
                  isNotSelectedCity();
                  customNavigate(context, AppNamePage.signInPage);
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
