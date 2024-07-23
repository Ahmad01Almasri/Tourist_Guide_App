import 'package:dartz/dartz.dart';
import 'package:tourist_guide/features/historical/data/data_sources/historical_remote_data_source.dart';
import 'package:tourist_guide/features/historical/data/models/historical_place_model.dart';
import 'package:tourist_guide/features/historical/domain/repositories/histprical_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';

class HistoricalRepositoryImpl implements HistoricalRepository {
  final HistoricalRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HistoricalRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<HistoricalModel>>> getAllHistorical(
      String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHistorical =
            await remoteDataSource.getAllHistorical(cityName);
        return Right(remoteHistorical);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
