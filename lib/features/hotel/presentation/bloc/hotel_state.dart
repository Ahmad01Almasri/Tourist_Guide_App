part of 'hotel_bloc.dart';

abstract class HotelState {
  const HotelState();

  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelState {}

class LoadingHotelState extends HotelState {}

class LoadedHotelState extends HotelState {
  final List<HotelModel> hotel;

  const LoadedHotelState({required this.hotel});

  @override
  List<Object> get props => [hotel];
}

class ErrorHotelState extends HotelState {
  final String message;

  const ErrorHotelState({required this.message});

  @override
  List<Object> get props => [message];
}
