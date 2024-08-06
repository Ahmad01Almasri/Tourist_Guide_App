import 'package:tourist_guide/features/comment/domain/repositories/comment_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class DeleteCommentUsecase {
  final CommentRepository repository;

  DeleteCommentUsecase(this.repository);

  Future<Either<Failure, Unit>> call(String commentId) async {
    return await repository.deleteComment(commentId);
  }
}
