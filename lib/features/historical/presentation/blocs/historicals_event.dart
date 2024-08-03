part of 'historicals_bloc.dart';

abstract class HistoricalEvent extends Equatable {
  const HistoricalEvent();

  @override
  List<Object> get props => [];
}

class GetAllHistoricalsEvent extends HistoricalEvent {
  final String? cityName;

  const GetAllHistoricalsEvent({this.cityName});

  @override
  List<Object> get props => [cityName!];
}

class RefreshHistoricalsEvent extends HistoricalEvent {
  final String cityName;

  const RefreshHistoricalsEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}
