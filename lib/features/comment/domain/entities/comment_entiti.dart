import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final String commentText;
  final String placeID;

  const Comment({
    required this.commentText,
    required this.placeID,
  });

  @override
  List<Object?> get props => [
        commentText,
        placeID,
      ];
}
