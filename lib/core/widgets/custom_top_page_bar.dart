import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTopPageBar extends StatelessWidget {
  final String pageName;
  const CustomTopPageBar({
    super.key,
    required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                size: 30,
                Icons.arrow_back,
                color: AppColors.white,
              ),
            ),
            SizedBox(
              width: 85,
            ),
            Text(
              pageName,
              style: AppTextStyles.poppinsBoldstyle18.copyWith(
                color: AppColors.white,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
