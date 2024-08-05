import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/get_comments_model.dart';
import '../repositories/comment_repo.dart';

class GetAllCommentUsecase {
  final CommentRepository repository;

  GetAllCommentUsecase(this.repository);

  Future<Either<Failure, List<GetCommentsModel>>> call() async {
    return await repository.getAllComment();
  }
}
