import 'dart:convert';

import 'package:tourist_guide/core/functions/save_place_id.dart';

import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import '../../../../core/utils/app_strings.dart';
import '../models/comment_model.dart';

abstract class CommentRemoteDataSource {
  Future<List<CommentModel>> getAllComment();
}

const baseUrl = AppStrings.baseUrl;

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final http.Client client;

  CommentRemoteDataSourceImpl({required this.client});
  @override
  Future<List<CommentModel>> getAllComment() async {
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
      final List<CommentModel> commentModels = decodedJson
          .map<CommentModel>(
              (jsonCommentModel) => CommentModel.fromJson(jsonCommentModel))
          .toList();

      return commentModels;
    } else {
      throw ServerException();
    }
  }
}
