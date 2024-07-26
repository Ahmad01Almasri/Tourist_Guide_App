import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/hotel_model.dart';
import '../repositories/hotel_repo.dart';

class GetAllHotelUsecase {
  final HotelRepository repository;

  GetAllHotelUsecase(this.repository);

  Future<Either<Failure, List<HotelModel>>> call(String cityName) async {
    return await repository.getAllHotel(cityName);
  }
}
