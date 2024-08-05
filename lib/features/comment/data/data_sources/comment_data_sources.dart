import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:tourist_guide/core/functions/save_place_id.dart';
import 'package:tourist_guide/features/comment/domain/entities/comment_entiti.dart';

import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import '../../../../core/services/shared_preferences_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/add_comment_model.dart';
import '../models/get_comments_model.dart';

abstract class CommentRemoteDataSource {
  Future<List<GetCommentsModel>> getAllComment();
  Future<Unit> addComment(AddCommentModel comment);
}

const baseUrl = AppStrings.baseUrl;

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final http.Client client;

  CommentRemoteDataSourceImpl({required this.client});
  @override
  Future<List<GetCommentsModel>> getAllComment() async {
    final body = {"placeID": getPlaceId()};
    final response = await client.post(
      Uri.parse("https://node-saleh.onrender.com/api/comments/commentsbyplace"),
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final List decodedJson = json.decode(response.body) as List;
      final List<GetCommentsModel> commentModels = decodedJson
          .map<GetCommentsModel>(
              (jsonCommentModel) => GetCommentsModel.fromJson(jsonCommentModel))
          .toList();

      return commentModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addComment(AddCommentModel comment) async {
    final String? myToken = SharedPreferencesService.getToken();
    final response = await client.post(
      Uri.parse("https://node-saleh.onrender.com/api/comments/addcomment"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${myToken!}',
      },
      body: jsonEncode(comment.toJson()),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode > 200 && response.statusCode < 300) {
      return Future.value(unit);
    } else {
      final errorResponse = jsonDecode(response.body);
      print('Error: ${errorResponse['message']}');
      throw ServerException();
    }
  }
}
