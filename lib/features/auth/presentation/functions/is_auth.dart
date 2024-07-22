import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';

void isAuth() {
  getIt<CacheHelper>().saveData(key: "isAuth", value: true);
}

void saveToken(String token) {
  getIt<CacheHelper>().saveData(key: "token", value: token);
}
