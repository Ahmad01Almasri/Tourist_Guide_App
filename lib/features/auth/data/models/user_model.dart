import '../../domain/entities/user.dart';

class PostModel extends Post {
  const PostModel(
      {required super.username, required super.email, required super.password});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        username: json['username'],
        password: json['password'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password, 'email': email};
  }
}
