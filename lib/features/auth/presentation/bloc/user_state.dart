part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class LoadingUserState extends UserState {}

class ErrorUserState extends UserState {
  final String message;

  const ErrorUserState({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccsessUserState extends UserState {
  final String message;

  const SuccsessUserState({required this.message});

  @override
  List<Object> get props => [message];
}
