import 'dart:convert';

import 'package:tourist_guide/features/historical/data/models/historical_place_model.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import 'package:tourist_guide/features/hotel/data/models/hotel_model.dart';
import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import '../../../../core/utils/app_strings.dart';

abstract class HotelRemoteDataSource {
  Future<List<HotelModel>> getAllHotel(cityName);
}

const baseUrl = AppStrings.baseUrl;

class HotelRemoteDataSourceImpl implements HotelRemoteDataSource {
  final http.Client client;

  HotelRemoteDataSourceImpl({required this.client});
  @override
  Future<List<HotelModel>> getAllHotel(cityName) async {
    final body = {
      "provinceName": getCityName(),
    };
    final response = await client.post(
      Uri.parse("$baseUrl/place/placebyprovince/hotels"),
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final List decodedJson = json.decode(response.body) as List;
      final List<HotelModel> hotelModels = decodedJson
          .map<HotelModel>(
              (jsonHotelModel) => HotelModel.fromJson(jsonHotelModel))
          .toList();

      return hotelModels;
    } else {
      throw ServerException();
    }
  }
}
