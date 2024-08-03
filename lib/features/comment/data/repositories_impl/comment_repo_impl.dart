import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/comment_repo.dart';
import '../data_sources/comment_data_sources.dart';
import '../models/comment_model.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CommentRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<CommentModel>>> getAllComment() async {
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
}
