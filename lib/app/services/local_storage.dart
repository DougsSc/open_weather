import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:open_weather/data/models/cities.dart';
import 'package:open_weather/data/models/open_weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key { weather }

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  OpenWeather? fetchWeather(Cities city) {
    final rawJson = _sharedPreferences?.getString('${_Key.weather}.${city.name}');
    if (rawJson == null) return null;

    return OpenWeather.fromJson(jsonDecode(rawJson));
  }

  FutureOr<void> storeWeather(Cities city, OpenWeather? value) async {
    if (value != null) {
      await _sharedPreferences?.setString('${_Key.weather}.${city.name}', json.encode(value.toJson()));
    } else {
      await _sharedPreferences?.remove('${_Key.weather}.${city.name}');
    }
  }
}
