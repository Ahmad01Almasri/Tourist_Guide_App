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

class MessageUserState extends UserState {
  final String message;

  const MessageUserState({required this.message});

  @override
  List<Object> get props => [message];
}
