import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourist_guide/features/comment/data/models/get_comments_model.dart';
import 'package:tourist_guide/features/comment/presentation/widgets/card_comment.dart';

import '../../../../core/functions/save_user_name.dart';
import '../../../../core/utils/app_colors.dart';

class CommentListWidget extends StatelessWidget {
  final List<GetCommentsModel>? comment;
  final bool isLoading;
  final Bloc? bloc;
  const CommentListWidget({
    super.key,
    this.comment,
    this.bloc,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return buildShimmerLoadingComment();
    } else {
      return ListView.builder(
        itemCount: comment!.length,
        itemBuilder: (context, index) {
          return CommentCard(
            // bloc: bloc!,
            commentId: comment![index].id.toString(),
            isHaveComments: comment![index].username.toString() == getUserName()
                ? true
                : false,
            avatarUrl: 'https://www.w3schools.com/w3images/avatar2.png',
            commentText: comment![index].commentText.toString(),
            timestamp: comment![index].timestamp.toString(),
            userName: comment![index].username.toString(),
          );
        },
      );
    }
  }
}

Widget buildShimmerLoadingComment() {
  return ListView.builder(
    itemCount: 6, // Number of shimmer cards to show
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
            baseColor: AppColors.primaryColor,
            highlightColor: AppColors.black38,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.black38,
                      radius: 25,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            )),
      );
    },
  );
}
