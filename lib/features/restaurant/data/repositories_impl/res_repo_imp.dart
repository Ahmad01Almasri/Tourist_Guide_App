import 'package:dartz/dartz.dart';
import 'package:tourist_guide/features/restaurant/domain/repositories/res_repo.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';

import '../data_sources/res_data_sources.dart';

import '../models/res_model.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RestaurantRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<RestaurantModel>>> getAllRestaurant(
      String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRestaurant =
            await remoteDataSource.getAllRestaurant(cityName);
        return Right(remoteRestaurant);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
