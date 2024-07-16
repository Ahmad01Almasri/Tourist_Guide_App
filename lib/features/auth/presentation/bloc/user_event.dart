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
