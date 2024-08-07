import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/hotel_repo.dart';
import '../data_sources/hotel_remote_data_sources.dart';
import '../models/hotel_model.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HotelRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<HotelModel>>> getAllHotel(String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHotel = await remoteDataSource.getAllHotel(cityName);
        return Right(remoteHotel);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
