part of 'hotel_bloc.dart';

abstract class HotelEvent {
  const HotelEvent();

  @override
  List<Object> get props => [];
}

class GetAllHotelEvent extends HotelEvent {
  final String? cityName;

  const GetAllHotelEvent({this.cityName});

  @override
  List<Object> get props => [cityName!];
}

class RefreshHotelEvent extends HotelEvent {
  final String cityName;

  const RefreshHotelEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}
