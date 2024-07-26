import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../data/models/hotel_model.dart';
import '../../domain/use_cases/get_all_hotel.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final GetAllHotelUsecase getAllHotel;

  HotelBloc({
    required this.getAllHotel,
  }) : super(HotelInitial()) {
    on<HotelEvent>((event, emit) async {
      if (event is GetAllHotelEvent) {
        emit(LoadingHotelState());

        final failureOrHotel = await getAllHotel(event.cityName);
        emit(_mapFailureOrHotelToState(failureOrHotel));
      } else if (event is RefreshHotelEvent) {
        emit(LoadingHotelState());

        final failureOrHotel = await getAllHotel(event.cityName);
        emit(_mapFailureOrHotelToState(failureOrHotel));
      }
    });
  }

  HotelState _mapFailureOrHotelToState(
      Either<Failure, List<HotelModel>> either) {
    return either.fold(
      (failure) => ErrorHotelState(message: _mapFailureToMessage(failure)),
      (hotel) => LoadedHotelState(
        hotel: hotel,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return AppStrings.EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return AppStrings.OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
