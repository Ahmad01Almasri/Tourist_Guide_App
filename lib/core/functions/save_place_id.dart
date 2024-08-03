import '../database/cache/cache_helper.dart';
import '../services/service_locator.dart';
import '../utils/storage_keys_string.dart';

void savePlaceId(String placeID) {
  getIt<CacheHelper>().saveData(key: AppStorageKey.placeId, value: placeID);
}

getPlaceId() {
  return getIt<CacheHelper>().getData(key: AppStorageKey.placeId);
}
