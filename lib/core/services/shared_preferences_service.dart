import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../extensions/colorful_logging_extension.dart';

class SharedPreferencesService {
  const SharedPreferencesService._();

  static late final SharedPreferences _sp;

  static Future<void> init() async =>
      _sp = await SharedPreferences.getInstance();

  static bool isAuth() {
    final bool isAuth = _sp.containsKey(SharedPreferencesKeys.accessToken);

    return isAuth;
  }

  static Future<bool> clearStorage() async {
    return await _sp.clear();
  }

  ////////////!         Token          ////////////

  static Future<bool> setToken(String token) async {
    final isDone =
        await _sp.setString(SharedPreferencesKeys.accessToken, token);
    if (isDone) {
      log(token.logGreen, name: 'token saved to storage');
    } else {
      log(token.logRed, name: 'token hasn\'t been saved to storage');
    }
    return isDone;
  }

  static String? getToken() {
    String? token = _sp.getString(SharedPreferencesKeys.accessToken);
    log(token.toString().logWhite, name: 'user token');
    return token;
  }

  static Future<bool> deleteToken() async {
    final isDone = await _sp.remove(SharedPreferencesKeys.accessToken);
    if (isDone) {
      log('token deleted from storage'.logGreen);
    } else {
      log('token hasn\'t been deleted from storage'.logRed);
    }
    return isDone;
  }
}

class SharedPreferencesKeys {
  const SharedPreferencesKeys._();

  static const String accessToken = 'accessToken';
}
