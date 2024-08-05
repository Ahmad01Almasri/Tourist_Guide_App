import 'package:dartz/dartz.dart';
import 'package:tourist_guide/features/comment/data/models/add_comment_model.dart';
import 'package:tourist_guide/features/comment/domain/entities/comment_entiti.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/comment_repo.dart';
import '../data_sources/comment_data_sources.dart';
import '../models/get_comments_model.dart';

typedef Future<Unit> AddComment();

class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CommentRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<GetCommentsModel>>> getAllComment() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteComment = await remoteDataSource.getAllComment();
        return Right(remoteComment);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addComment(Comment comment) async {
    final AddCommentModel commentModel = AddCommentModel(
        commentText: comment.commentText, placeID: comment.placeID);

    return await _getMessage(() {
      return remoteDataSource.addComment(commentModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(AddComment addComment) async {
    if (await networkInfo.isConnected) {
      try {
        await addComment();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
