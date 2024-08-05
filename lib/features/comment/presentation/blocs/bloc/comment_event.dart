part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class GetAllCommentEvent extends CommentEvent {
  const GetAllCommentEvent();

  @override
  List<Object> get props => [];
}

class RefreshCommentEvent extends CommentEvent {
  const RefreshCommentEvent();

  @override
  List<Object> get props => [];
}

class AddCommentEvent extends CommentEvent {
  final Comment comment;

  const AddCommentEvent({required this.comment});

  @override
  List<Object> get props => [comment];
}
