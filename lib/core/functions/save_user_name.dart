import '../database/cache/cache_helper.dart';
import '../services/service_locator.dart';
import '../utils/storage_keys_string.dart';

void saveUserName(String userName) {
  getIt<CacheHelper>().saveData(key: AppStorageKey.userName, value: userName);
}

getUserName() {
  return getIt<CacheHelper>().getData(key: AppStorageKey.userName);
}
