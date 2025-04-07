import 'dart:async';

import 'package:open_weather/app/core/usecases/param_use_case.dart';
import 'package:open_weather/data/models/lat_lng.dart';
import 'package:open_weather/data/models/open_weather.dart';
import 'package:open_weather/domain/repositories/weather_repository.dart';

class FetchWeatherUseCase extends ParamUseCase<OpenWeather, LatLng> {
  FetchWeatherUseCase(this._repo);

  final WeatherRepository _repo;

  @override
  FutureOr<OpenWeather> execute(LatLng latLng) => _repo.fetchWeather(latLng);
}
