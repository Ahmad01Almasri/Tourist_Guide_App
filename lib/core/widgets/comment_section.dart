import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';

import '../functions/navigation.dart';
import '../utils/app_route_string.dart';
import '../utils/app_strings.dart';
import 'custom_text_field.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
    required this.textController,
    this.onPressedUploadComment,
    this.onViewComment,
  });
  final void Function()? onPressedUploadComment;
  final TextEditingController textController;
  final void Function()? onViewComment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: CustomTextForm(
                      hinttext: AppStrings.writeSomethingHere,
                      mycontroller: textController,
                      obscureText: false)),
              IconButton(
                  iconSize: 35,
                  onPressed: onPressedUploadComment,
                  icon: Icon(
                    Icons.arrow_circle_up,
                    color: AppColors.black,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
              height: 40,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              color: AppColors.primaryColor,
              onPressed: () {
                customNavigate(context, AppNamePage.commentsPage);
              },
              child: Text(
                AppStrings.viewComments,
                style: AppTextStyles.poppinsBoldstyle18
                    .copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
