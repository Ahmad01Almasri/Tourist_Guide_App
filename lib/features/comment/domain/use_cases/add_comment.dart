import 'package:dartz/dartz.dart';
import 'package:tourist_guide/features/comment/domain/entities/comment_entiti.dart';
import 'package:tourist_guide/features/comment/domain/repositories/comment_repo.dart';

import '../../../../core/error/failures.dart';

class AddCommentUsecase {
  final CommentRepository repository;

  AddCommentUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Comment comment) async {
    return await repository.addComment(comment);
  }
}
