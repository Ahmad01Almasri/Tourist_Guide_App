import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repo.dart';

class SignUpUserUsecase {
  final UserRepository repository;

  SignUpUserUsecase(this.repository);

  Future<Either<Failure, Unit>> call(User user) async {
    return await repository.signupUser(user);
  }
}
