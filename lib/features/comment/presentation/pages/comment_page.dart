import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';
import 'package:tourist_guide/features/comment/presentation/blocs/bloc/comment_bloc.dart';
import 'package:tourist_guide/features/comment/presentation/widgets/all_comment_list.dart';
import 'package:tourist_guide/core/widgets/message_display_widget.dart';

class CommentsPage extends StatefulWidget {
  CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  void initState() {
    BlocProvider.of<CommentBloc>(context).add(const RefreshCommentEvent());
    super.initState();
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<CommentBloc>(context).add(const RefreshCommentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          style:
              AppTextStyles.poppinsBoldstyle24.copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<CommentBloc, CommentState>(
          listener: (context, state) {
            if (state is CommentDeletedState) {
              BlocProvider.of<CommentBloc>(context)
                  .add(const GetAllCommentEvent());
            }
          },
          builder: (context, state) {
            if (state is LoadingCommentState) {
              return const CommentListWidget(isLoading: true);
            } else if (state is LoadedCommentState) {
              return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: CommentListWidget(
                  bloc: BlocProvider.of<CommentBloc>(context),
                  isLoading: false,
                  comment: state.comments,
                ),
              );
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
    );
  }
}
