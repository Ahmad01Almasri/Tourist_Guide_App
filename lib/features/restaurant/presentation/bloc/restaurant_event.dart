part of 'restaurant_bloc.dart';

abstract class RestaurantEvent {
  const RestaurantEvent();

  @override
  List<Object> get props => [];
}

class GetAllRestaurantEvent extends RestaurantEvent {
  final String? cityName;

  const GetAllRestaurantEvent({this.cityName});

  @override
  List<Object> get props => [cityName!];
}

class RefreshRestaurantEvent extends RestaurantEvent {
  final String cityName;

  const RefreshRestaurantEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}
