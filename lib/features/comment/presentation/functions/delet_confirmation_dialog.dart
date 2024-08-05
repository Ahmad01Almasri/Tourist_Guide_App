import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';

import '../../../../core/widgets/snackbar_message.dart';

Future<void> showDeleteCommentConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // User must tap a button to confirm or cancel
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirm Delete Comment',
          style: AppTextStyles.poppinsThinW6000style22,
        ),
        content: Text(
          'Are you sure you want to delet comment?',
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
                        .copyWith(color: AppColors.green)),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        AppColors.black38.withOpacity(0.7))),
                child: Text('Delete',
                    style: AppTextStyles.poppinsBoldstyle16
                        .copyWith(color: AppColors.red)),
                onPressed: () {
                  // Execute logout actions here

                  Navigator.of(context).pop();
                  // Close the dialog
                  SnackBarMessage().showErrorSnackBar(
                      context: context, message: "Comment deleted");
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
