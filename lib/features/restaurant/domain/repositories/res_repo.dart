import 'package:tourist_guide/features/hotel/data/models/hotel_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/res_model.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<RestaurantModel>>> getAllRestaurant(
      String cityName);
}
