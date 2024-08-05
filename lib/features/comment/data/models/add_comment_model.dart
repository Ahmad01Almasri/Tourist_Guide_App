import '../../domain/entities/comment_entiti.dart';

class AddCommentModel extends Comment {
  const AddCommentModel({
    required super.commentText,
    required super.placeID,
  });

  factory AddCommentModel.fromJson(Map<String, dynamic> json) {
    return AddCommentModel(
      commentText: json['commentText'],
      placeID: json['placeID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'commentText': commentText, 'placeID': placeID};
  }
}
