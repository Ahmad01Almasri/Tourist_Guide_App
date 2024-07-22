import 'dart:convert';

import 'package:tourist_guide/core/utils/app_strings.dart';
import 'package:tourist_guide/features/auth/data/models/user_model.dart';

import '../../../../core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/services/shared_preferences_service.dart';

abstract class UserRemoteDataSource {
  Future<Unit> signupUser(UserModel userModel);
  Future<Unit> loginUser(UserModel2 userModel2);
}

const baseUrl = AppStrings.baseUrl;

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> loginUser(UserModel2 userModel2) async {
    final response = await client.post(
      Uri.parse("$baseUrl/auth/login/"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userModel2.toJson()),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      SharedPreferencesService.setToken(responseData['token']);

      return Future.value(unit);
    } else {
      try {
        final errorResponse = jsonDecode(response.body);
        print('Error: ${errorResponse['message']}');
        throw ServerException();
      } catch (e) {
        print('Error: Could not parse error response');
        throw ServerException();
      }
    }
  }

  @override
  Future<Unit> signupUser(UserModel userModel) async {
    final response = await client.post(
      Uri.parse("$baseUrl/auth/register/"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userModel.toJson()),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode > 200 && response.statusCode < 300) {
      final responseData = jsonDecode(response.body);
      SharedPreferencesService.setToken(responseData['token']);
      return Future.value(unit);
    } else {
      // الحصول على تفاصيل الخطأ
      final errorResponse = jsonDecode(response.body);
      print('Error: ${errorResponse['message']}');
      throw ServerException();
    }
  }
}
