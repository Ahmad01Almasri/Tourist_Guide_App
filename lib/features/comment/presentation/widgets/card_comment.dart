import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tourist_guide/core/widgets/snackbar_message.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../functions/delet_confirmation_dialog.dart';
import '../functions/edit_comment_dialog.dart';

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
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          CustomSlidableAction(
            onPressed: (context) {
              // Add edit functionality here
              // For example, show an edit dialog
              showEditCommentDialog(context, commentText);
            },
            backgroundColor: AppColors.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit, color: AppColors.white),
                const SizedBox(height: 4),
                Text(
                  'Edit',
                  style: AppTextStyles.poppinsw600style14
                      .copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 3,
          ),
          CustomSlidableAction(
            onPressed: (context) {
              // Add delete functionality here
              showDeleteCommentConfirmationDialog(context);
            },
            backgroundColor: AppColors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete, color: AppColors.white),
                const SizedBox(height: 4),
                Text(
                  'Delete',
                  style: AppTextStyles.poppinsw600style14
                      .copyWith(color: AppColors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
      child: Card(
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                    Text(timestamp,
                        style: AppTextStyles.poppinsw600style14
                            .copyWith(color: AppColors.black38))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
