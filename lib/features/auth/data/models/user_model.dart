import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.username, required super.email, required super.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        username: json['username'],
        password: json['password'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password, 'email': email};
  }
}
