import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/comment_model.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<CommentModel>>> getAllComment();
}
