import 'package:tourist_guide/features/hotel/data/models/hotel_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class HotelRepository {
  Future<Either<Failure, List<HotelModel>>> getAllHotel(String cityName);
}
