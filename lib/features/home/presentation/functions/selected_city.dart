import 'package:tourist_guide/core/utils/storage_keys_string.dart';
import 'package:tourist_guide/features/home/presentation/functions/select_city_dialog.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';

void isSelectedCity() {
  getIt<CacheHelper>().saveData(key: AppStorageKey.isSelectedCity, value: true);
}

void isNotSelectedCity() {
  getIt<CacheHelper>()
      .saveData(key: AppStorageKey.isSelectedCity, value: false);
}

void saveCityName() {
  getIt<CacheHelper>()
      .saveData(key: AppStorageKey.CityName, value: selectedCity);
}

getCityName() {
  return getIt<CacheHelper>().getData(key: AppStorageKey.CityName);
}
