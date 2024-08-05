import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

void showEditCommentDialog(BuildContext context, String initialComment) {
  TextEditingController _commentController =
      TextEditingController(text: initialComment);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
            child:
                Text('Edit Comment', style: AppTextStyles.poppinsBoldstyle24)),
        content: TextField(
          style:
              AppTextStyles.poppinsBoldstyle18.copyWith(color: AppColors.black),
          controller: _commentController,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter your comment',
              hintStyle: AppTextStyles.poppinsW500style16),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor),
                child: Text('Cancel',
                    style: AppTextStyles.poppinsw600style14
                        .copyWith(color: AppColors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  // يمكنك هنا تنفيذ وظيفة تحديث التعليق
                  String updatedComment = _commentController.text;
                  // تنفيذ عملية التحديث...
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor),
                child: Text('Save',
                    style: AppTextStyles.poppinsw600style14
                        .copyWith(color: AppColors.white)),
              ),
            ],
          ),
        ],
      );
    },
  );
}
