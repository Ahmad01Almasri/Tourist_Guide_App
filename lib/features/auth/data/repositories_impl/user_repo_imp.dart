import 'package:dartz/dartz.dart';
import 'package:tourist_guide/features/auth/data/models/user_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repo.dart';
import '../data_sources/user_remote_data_source.dart';

typedef Future<Unit> SignUpOrLoginUser();

class UsersRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  // final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UsersRepositoryImpl(
      {required this.remoteDataSource,
      // required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> signupUser(User user) async {
    final UserModel userModel = UserModel(
        username: user.username, email: user.email, password: user.password);

    return await _getMessage(() {
      return remoteDataSource.signupUser(userModel);
    });
  }

  // @override
  // Future<Either<Failure, Unit>> deletePost(int postId) async {
  //   return await _getMessage(() {
  //     return remoteDataSource.deletePost(postId);
  //   });
  // }

  // @override
  // Future<Either<Failure, Unit>> updatePost(Post post) async {
  //   final PostModel postModel =
  //       PostModel(id: post.id, title: post.title, body: post.body);

  //   return await _getMessage(() {
  //     return remoteDataSource.updatePost(postModel);
  //   });
  // }

  Future<Either<Failure, Unit>> _getMessage(
      SignUpOrLoginUser signUpOrLoginUser) async {
    if (await networkInfo.isConnected) {
      try {
        await signUpOrLoginUser();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> loginUser(User user) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
}
