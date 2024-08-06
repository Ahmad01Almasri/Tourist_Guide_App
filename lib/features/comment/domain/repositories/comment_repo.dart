import 'package:dartz/dartz.dart';
import 'package:tourist_guide/features/comment/domain/entities/comment_entiti.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/get_comments_model.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<GetCommentsModel>>> getAllComment();
  Future<Either<Failure, Unit>> addComment(Comment comment);
  Future<Either<Failure, Unit>> deleteComment(String id);
  Future<Either<Failure, Unit>> updateComment(String newText, String id);
}
