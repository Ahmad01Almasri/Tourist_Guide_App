import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String email;
  final String password;

  const User({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [username, email, password];
}

class User2 extends Equatable {
  final String email;
  final String password;

  const User2({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
