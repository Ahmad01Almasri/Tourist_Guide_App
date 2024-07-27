part of 'restaurant_bloc.dart';

abstract class RestaurantState {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class LoadingRestaurantState extends RestaurantState {}

class LoadedRestaurantState extends RestaurantState {
  final List<RestaurantModel> restaurant;

  const LoadedRestaurantState({required this.restaurant});

  @override
  List<Object> get props => [restaurant];
}

class ErrorRestaurantState extends RestaurantState {
  final String message;

  const ErrorRestaurantState({required this.message});

  @override
  List<Object> get props => [message];
}
