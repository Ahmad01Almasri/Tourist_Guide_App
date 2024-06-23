import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../functions/selected_city.dart';
import 'notifications_container.dart';

class TopRowHomeSection extends StatelessWidget {
  const TopRowHomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.black,
                size: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                getCityName(),
                style: AppTextStyles.poppinsBoldstyle24,
              ),
            ],
          ),
          const ContainerNotifications()
        ],
      ),
    );
  }
}
