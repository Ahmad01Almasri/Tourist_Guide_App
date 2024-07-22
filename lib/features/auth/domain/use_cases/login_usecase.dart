import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repo.dart';

class LoginUserUsecase {
  final UserRepository repository;

  LoginUserUsecase(this.repository);

  Future<Either<Failure, Unit>> call(User2 user2) async {
    return await repository.loginUser(user2);
  }
}
