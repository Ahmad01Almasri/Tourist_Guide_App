import 'package:tourist_guide/core/utils/storage_keys_string.dart';

import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/services/service_locator.dart';

void onBoardingVisited() {
  getIt<CacheHelper>()
      .saveData(key: AppStorageKey.isOnBoardingVisited, value: true);
}
