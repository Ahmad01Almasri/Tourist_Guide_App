import 'package:dartz/dartz.dart';
import 'package:tourist_guide/features/restaurant/data/models/res_model.dart';
import 'package:tourist_guide/features/restaurant/domain/repositories/res_repo.dart';

import '../../../../core/error/failures.dart';

class GetAllRestaurantUsecase {
  final RestaurantRepository repository;

  GetAllRestaurantUsecase(this.repository);

  Future<Either<Failure, List<RestaurantModel>>> call(String cityName) async {
    return await repository.getAllRestaurant(cityName);
  }
}
