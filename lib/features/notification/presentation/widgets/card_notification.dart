import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/notification_model.dart';

class CardNotificationItem extends StatelessWidget {
  const CardNotificationItem({
    super.key,
    required this.notification,
  });

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(
          Icons.notification_important,
          size: 30,
          color: notification.read ? AppColors.black38 : AppColors.primaryColor,
        ),
        title: Text(
          notification.title,
          style: AppTextStyles.poppinsBoldstyle18.copyWith(
            color: AppColors.black,
          ),
        ),
        subtitle: Text(
          notification.message,
          style: AppTextStyles.poppinsBoldstyle18.copyWith(
            color: AppColors.black38,
          ),
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
