import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/snackbar_message.dart';
import '../blocs/bloc/comment_bloc.dart';

void showEditCommentDialog(
    BuildContext context, String initialComment, String commentId) async {
  final bloc = BlocProvider.of<CommentBloc>(context);
  TextEditingController commentController =
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
          controller: commentController,
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
                    backgroundColor: AppColors.black38.withOpacity(0.7)),
                child: Text('Cancel',
                    style: AppTextStyles.poppinsw600style14
                        .copyWith(color: AppColors.red)),
              ),
              ElevatedButton(
                onPressed: () async {
                  // أضف الحدث لتحديث التعليق
                  bloc.add(
                    UpdateCommentEvent(
                      newText: commentController.text,
                      id: commentId,
                    ),
                  );
                  Navigator.of(context).pop();

                  // استمع إلى حالة النجاح أو الفشل لتحديث التعليق
                  final subscription = bloc.stream.listen((state) async {
                    if (state is SuccessCommentState) {
                      bloc.add(const RefreshCommentEvent());
                      SnackBarMessage().showSuccessSnackBar(
                          message: state.message, context: context);
                    } else if (state is ErrorCommentState) {}
                  });

                  // إلغاء الاشتراك بعد الاستخدام
                  await Future.delayed(Duration(seconds: 30));
                  await subscription.cancel();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black38.withOpacity(0.7)),
                child: Text('Save',
                    style: AppTextStyles.poppinsw600style14
                        .copyWith(color: AppColors.green)),
              ),
            ],
          ),
        ],
      );
    },
  );
}
