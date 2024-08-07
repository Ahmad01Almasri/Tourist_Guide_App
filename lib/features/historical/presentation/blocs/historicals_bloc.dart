import 'package:bloc/bloc.dart';
import 'package:tourist_guide/features/historical/data/models/historical_place_model.dart';
import 'package:tourist_guide/features/historical/domain/use_cases/get_all_historicals.dart';
import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/functions/failure_bloc_message.dart';
import '../../../../core/utils/app_strings.dart';

part 'historicals_event.dart';
part 'historicals_state.dart';

class HistoricalBloc extends Bloc<HistoricalEvent, HistoricalState> {
  final GetAllHistoricalUsecase getAllHistorical;

  HistoricalBloc({
    required this.getAllHistorical,
  }) : super(HistoricalInitial()) {
    on<HistoricalEvent>((event, emit) async {
      if (event is GetAllHistoricalsEvent) {
        emit(LoadingHistoricalState());

        final failureOrHistoricals =
            await getAllHistorical(event.cityName.toString());
        emit(_mapFailureOrHistoricalToState(failureOrHistoricals));
      } else if (event is RefreshHistoricalsEvent) {
        emit(LoadingHistoricalState());

        final failureOrHistoricals = await getAllHistorical(event.cityName);
        emit(_mapFailureOrHistoricalToState(failureOrHistoricals));
      }
    });
  }

  HistoricalState _mapFailureOrHistoricalToState(
      Either<Failure, List<HistoricalModel>> either) {
    return either.fold(
      (failure) => ErrorHistoricalState(message: mapFailureToMessage(failure)),
      (historicals) => LoadedHistoricalsState(
        historicals: historicals,
      ),
    );
  }
}
