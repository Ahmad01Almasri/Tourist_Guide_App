import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/functions/failure_bloc_message.dart';
import '../../data/models/res_model.dart';

import '../../../../core/error/failures.dart';

import '../../domain/use_cases/get_all_res.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final GetAllRestaurantUsecase getAllRestaurant;

  RestaurantBloc({
    required this.getAllRestaurant,
  }) : super(RestaurantInitial()) {
    on<RestaurantEvent>((event, emit) async {
      if (event is GetAllRestaurantEvent) {
        emit(LoadingRestaurantState());

        final failureOrRestaurant =
            await getAllRestaurant(event.cityName.toString());
        emit(_mapFailureOrRestaurantToState(failureOrRestaurant));
      } else if (event is RefreshRestaurantEvent) {
        emit(LoadingRestaurantState());

        final failureOrRestaurant = await getAllRestaurant(event.cityName);
        emit(_mapFailureOrRestaurantToState(failureOrRestaurant));
      }
    });
  }

  RestaurantState _mapFailureOrRestaurantToState(
      Either<Failure, List<RestaurantModel>> either) {
    return either.fold(
      (failure) => ErrorRestaurantState(message: mapFailureToMessage(failure)),
      (restaurant) => LoadedRestaurantState(
        restaurant: restaurant,
      ),
    );
  }
}
