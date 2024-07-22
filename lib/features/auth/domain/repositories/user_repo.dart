import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> signupUser(User user);
  Future<Either<Failure, Unit>> loginUser(User2 user2);
}
