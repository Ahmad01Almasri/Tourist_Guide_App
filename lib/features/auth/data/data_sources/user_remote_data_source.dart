import 'dart:convert';

import 'package:tourist_guide/features/auth/data/models/user_model.dart';

import '../../../../core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<Unit> signupUser(UserModel userModel);
  Future<Unit> loginUser(UserModel userModel);
}

const baseUrl = "https://node-saleh.onrender.com/api/auth";

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> loginUser(UserModel userModel) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Unit> signupUser(UserModel userModel) async {
    final response = await client.post(
      Uri.parse("$baseUrl/register/"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userModel.toJson()),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode > 200 && response.statusCode < 300) {
      return Future.value(unit);
    } else {
      // الحصول على تفاصيل الخطأ
      final errorResponse = jsonDecode(response.body);
      print('Error: ${errorResponse['message']}');
      throw ServerException();
    }
  }
}
