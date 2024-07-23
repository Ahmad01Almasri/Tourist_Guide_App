import 'dart:convert';

import 'package:tourist_guide/features/historical/data/models/historical_place_model.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import '../../../../core/utils/app_strings.dart';

abstract class HistoricalRemoteDataSource {
  Future<List<HistoricalModel>> getAllHistorical(cityName);
}

const baseUrl = AppStrings.baseUrl;

class HistoricalRemoteDataSourceImpl implements HistoricalRemoteDataSource {
  final http.Client client;

  HistoricalRemoteDataSourceImpl({required this.client});
  @override
  Future<List<HistoricalModel>> getAllHistorical(cityName) async {
    final body = {
      "provinceName": getCityName(),
    };
    final response = await client.post(
      Uri.parse("$baseUrl/place/placebyprovince/"), body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
      // body: jsonEncode(HistoricalModel.toJson()),
    );
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final List decodedJson = json.decode(response.body) as List;
      final List<HistoricalModel> historicalModels = decodedJson
          .map<HistoricalModel>((jsonHistoricalModel) =>
              HistoricalModel.fromJson(jsonHistoricalModel))
          .toList();

      return historicalModels;
    } else {
      throw ServerException();
    }
  }
//  if (response.statusCode == 201) {
//       return Future.value(unit);
//     } else {
//       throw ServerException();
//     }
}
