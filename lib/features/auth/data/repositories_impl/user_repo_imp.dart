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
  final NetworkInfo networkInfo;

  UsersRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> signupUser(User user) async {
    final UserModel userModel = UserModel(
        username: user.username, email: user.email, password: user.password);

    return await _getMessage(() {
      return remoteDataSource.signupUser(userModel);
    });
  }

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
  Future<Either<Failure, Unit>> loginUser(User2 user2) async {
    final UserModel2 userModel2 =
        UserModel2(email: user2.email, password: user2.password);

    return await _getMessage(() {
      return remoteDataSource.loginUser(userModel2);
    });
  }
}
