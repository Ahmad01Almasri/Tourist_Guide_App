import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../repositories/comment_repo.dart';

class UpdateCommentUsecase {
  final CommentRepository repository;

  UpdateCommentUsecase(this.repository);

  Future<Either<Failure, Unit>> call(String newText, String id) async {
    return await repository.updateComment(newText, id);
  }
}
