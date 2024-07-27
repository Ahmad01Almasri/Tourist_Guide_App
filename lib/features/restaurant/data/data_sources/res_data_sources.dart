import 'dart:convert';

import 'package:tourist_guide/features/historical/data/models/historical_place_model.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import 'package:tourist_guide/features/hotel/data/models/hotel_model.dart';
import 'package:tourist_guide/features/restaurant/data/models/res_model.dart';
import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import '../../../../core/utils/app_strings.dart';

abstract class RestaurantRemoteDataSource {
  Future<List<RestaurantModel>> getAllRestaurant(cityName);
}

const baseUrl = AppStrings.baseUrl;

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final http.Client client;

  RestaurantRemoteDataSourceImpl({required this.client});
  @override
  Future<List<RestaurantModel>> getAllRestaurant(cityName) async {
    final body = {
      "provinceName": getCityName(),
    };
    final response = await client.post(
      Uri.parse("$baseUrl/place/placebyprovince/restaurants"),
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      final List decodedJson = json.decode(response.body) as List;
      final List<RestaurantModel> restaurantModels = decodedJson
          .map<RestaurantModel>((jsonRestaurantModel) =>
              RestaurantModel.fromJson(jsonRestaurantModel))
          .toList();

      return restaurantModels;
    } else {
      throw ServerException();
    }
  }
}
