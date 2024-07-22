part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignUpUserEvent extends UserEvent {
  final User user;

  SignUpUserEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class LoginUserEvent extends UserEvent {
  final User2 user2;

  const LoginUserEvent({required this.user2});

  @override
  List<Object> get props => [user2];
}
