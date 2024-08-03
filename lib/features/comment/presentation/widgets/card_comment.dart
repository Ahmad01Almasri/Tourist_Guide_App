import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CommentCard extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String commentText;
  final String timestamp;
  final bool isHaveComments;
  const CommentCard({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.commentText,
    required this.timestamp,
    required this.isHaveComments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
              radius: 25,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName, style: AppTextStyles.poppinsBoldstyle18),
                  const SizedBox(height: 5),
                  Text(commentText,
                      style: AppTextStyles.poppinsBoldstyle16
                          .copyWith(color: AppColors.black)),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(timestamp,
                          style: AppTextStyles.poppinsw600style14
                              .copyWith(color: AppColors.black38)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
