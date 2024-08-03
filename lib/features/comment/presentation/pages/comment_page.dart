import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_guide/core/widgets/loading_widget.dart';
import 'package:tourist_guide/features/comment/presentation/blocs/bloc/comment_bloc.dart';
import 'package:tourist_guide/injection_container.dart' as di;

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/message_display_widget.dart';
import '../widgets/all_comment_list.dart';

class CommentsPage extends StatelessWidget {
  CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<CommentBloc>()..add(GetAllCommentEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(size: 35, Icons.arrow_back, color: AppColors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text(
            'Comments',
            style: AppTextStyles.poppinsBoldstyle24
                .copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<CommentBloc, CommentState>(
              builder: (context, state) {
                if (state is LoadingCommentState) {
                  return const CommentListWidget(isLoading: true);
                } else if (state is LoadedCommentState) {
                  return RefreshIndicator(
                      onRefresh: () => _onRefresh(context),
                      child: CommentListWidget(
                        isLoading: false,
                        comment: state.comments,
                      ));
                } else if (state is ErrorCommentState) {
                  return MessageDisplayWidget(
                    message: state.message,
                    onPressed: () => _onRefresh(context),
                  );
                }
                return const CommentListWidget(isLoading: true);
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _onRefresh(BuildContext context) async {
  BlocProvider.of<CommentBloc>(context).add(RefreshCommentEvent());
}
