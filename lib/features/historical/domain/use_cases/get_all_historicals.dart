import 'package:dartz/dartz.dart';
import 'package:tourist_guide/features/historical/data/models/historical_place_model.dart';

import '../../../../core/error/failures.dart';
import '../repositories/histprical_repository.dart';

class GetAllHistoricalUsecase {
  final HistoricalRepository repository;

  GetAllHistoricalUsecase(this.repository);

  Future<Either<Failure, List<HistoricalModel>>> call(String cityName) async {
    return await repository.getAllHistorical(cityName);
  }
}
