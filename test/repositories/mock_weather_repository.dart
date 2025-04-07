import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:open_weather/data/models/open_weather.dart';
import 'package:open_weather/domain/repositories/weather_repository.dart';

class MockWeatherRepository extends WeatherRepository {
  @override
  FutureOr<OpenWeather> fetchWeather(_) async {
    final file = await File('test/data/open_weather_sample.json').readAsString();
    final data = await json.decode(file);

    return OpenWeather.fromJson(data);
  }
}
