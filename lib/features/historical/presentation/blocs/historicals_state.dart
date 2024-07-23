part of 'historicals_bloc.dart';

abstract class HistoricalState extends Equatable {
  const HistoricalState();

  @override
  List<Object> get props => [];
}

class HistoricalInitial extends HistoricalState {}

class LoadingHistoricalState extends HistoricalState {}

class LoadedHistoricalsState extends HistoricalState {
  final List<HistoricalModel> historicals;

  const LoadedHistoricalsState({required this.historicals});

  @override
  List<Object> get props => [historicals];
}

class ErrorHistoricalState extends HistoricalState {
  final String message;

  const ErrorHistoricalState({required this.message});

  @override
  List<Object> get props => [message];
}
