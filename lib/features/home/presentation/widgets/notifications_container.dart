import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ContainerNotifications extends StatelessWidget {
  const ContainerNotifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppColors.black38.withOpacity(0.12)),
      child: Stack(
        alignment: const Alignment(0.3, -0.4),
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded)),
          Container(
            height: 6,
            width: 6,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.red),
          )
        ],
      ),
    );
  }
}
