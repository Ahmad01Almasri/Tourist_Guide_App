part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class LoadingCommentState extends CommentState {}

class LoadedCommentState extends CommentState {
  final List<GetCommentsModel> comments;

  const LoadedCommentState({required this.comments});

  @override
  List<Object> get props => [comments];
}

class ErrorCommentState extends CommentState {
  final String message;

  const ErrorCommentState({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccessCommentState extends CommentState {
  final String message;

  const SuccessCommentState({required this.message});

  @override
  List<Object> get props => [message];
}

class CommentDeletedState extends CommentState {}

class CommentUpdateState extends CommentState {}
