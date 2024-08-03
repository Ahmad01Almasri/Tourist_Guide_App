import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/comment_model.dart';
import '../repositories/comment_repo.dart';

class GetAllCommentUsecase {
  final CommentRepository repository;

  GetAllCommentUsecase(this.repository);

  Future<Either<Failure, List<CommentModel>>> call() async {
    return await repository.getAllComment();
  }
}
