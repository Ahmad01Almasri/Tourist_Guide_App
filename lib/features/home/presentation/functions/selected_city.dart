import 'package:tourist_guide/features/home/presentation/functions/select_city_dialog.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';

void isSelectedCity() {
  getIt<CacheHelper>().saveData(key: "isSelectedCity", value: true);
}

void saveCityName() {
  getIt<CacheHelper>().saveData(key: "saveCityName", value: selectedCity);
}
