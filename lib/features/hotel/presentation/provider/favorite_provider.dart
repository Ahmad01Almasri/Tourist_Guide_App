import 'package:flutter/material.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/models/all_hotel_model.dart';

class FavoriteProvider with ChangeNotifier {
  final CacheHelper cacheHelper = getIt<CacheHelper>();

  Map<String, bool> _favorites = {};

  FavoriteProvider() {
    _loadFavorites();
  }

  bool isFavorite(String itemName) {
    return _favorites[itemName] ?? false;
  }

  void toggleFavorite(String itemName) {
    _favorites[itemName] = !isFavorite(itemName);
    cacheHelper.saveData(
        key: '${itemName}_favorite', value: _favorites[itemName]);
    notifyListeners();
  }

  void _loadFavorites() {
    List<String> itemNames = ["Hotel A", "Hotel B", "Hotel C", "Hotel D"];
    for (var itemName in itemNames) {
      _favorites[itemName] =
          cacheHelper.getData(key: '${itemName}_favorite') ?? false;
    }
    notifyListeners();
  }

  List<AllHotelModel> getFavoriteHotels(List<AllHotelModel> hotels) {
    return hotels.where((hotel) => isFavorite(hotel.itemName)).toList();
  }
}
