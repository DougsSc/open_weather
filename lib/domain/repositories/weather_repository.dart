import 'dart:async';

import 'package:open_weather/data/models/lat_lng.dart';
import 'package:open_weather/data/models/open_weather.dart';

abstract class WeatherRepository {
  FutureOr<OpenWeather> fetchWeather(LatLng latLng);
}
