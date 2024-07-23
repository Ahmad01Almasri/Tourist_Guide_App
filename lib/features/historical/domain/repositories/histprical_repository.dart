import '../../data/models/historical_place_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class HistoricalRepository {
  Future<Either<Failure, List<HistoricalModel>>> getAllHistorical(
      String cityName);
}
