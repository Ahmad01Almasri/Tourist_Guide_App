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

class DeleteCommentEvent extends CommentEvent {
  final String commentId;

  const DeleteCommentEvent({required this.commentId});

  @override
  List<Object> get props => [commentId];
}

class UpdateCommentEvent extends CommentEvent {
  final String newText;
  final String id;

  const UpdateCommentEvent({
    required this.newText,
    required this.id,
  });

  @override
  List<Object> get props => [newText, id];
}
