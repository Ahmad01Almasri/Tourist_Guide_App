import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class SwitchButtonReadUnRead extends StatelessWidget {
  const SwitchButtonReadUnRead({
    super.key,
    required ValueNotifier<int> selectedTabIndex,
    required ValueNotifier<bool> showReadNotifications,
  })  : _selectedTabIndex = selectedTabIndex,
        _showReadNotifications = showReadNotifications;

  final ValueNotifier<int> _selectedTabIndex;
  final ValueNotifier<bool> _showReadNotifications;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<int>(
        valueListenable: _selectedTabIndex,
        builder: (context, selectedIndex, _) {
          return ToggleButtons(
            isSelected: [
              selectedIndex == 0,
              selectedIndex == 1,
            ],
            onPressed: (int index) {
              _selectedTabIndex.value = index;
              _showReadNotifications.value = index == 0;
            },
            selectedColor: AppColors.white,
            fillColor: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8.0),
            borderWidth: 1.0,
            borderColor: AppColors.primaryColor,
            splashColor: AppColors.black38,
            highlightColor: Colors.blue.withOpacity(0.5),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  AppStrings.read,
                  style: AppTextStyles.poppinsW500style16.copyWith(
                    color: selectedIndex == 1
                        ? AppColors.black38
                        : AppColors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  AppStrings.unread,
                  style: AppTextStyles.poppinsW500style16.copyWith(
                    color: selectedIndex == 0
                        ? AppColors.black38
                        : AppColors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
