import 'dart:async';

import 'package:open_weather/app/config/app_consts.dart';
import 'package:open_weather/data/models/lat_lng.dart';
import 'package:open_weather/data/models/open_weather.dart';
import 'package:open_weather/data/providers/network/api_endpoint.dart';
import 'package:open_weather/data/providers/network/api_provider.dart';
import 'package:open_weather/domain/repositories/weather_repository.dart';

class OpenWeatherRepositoryImpl extends WeatherRepository {
  @override
  FutureOr<OpenWeather> fetchWeather(LatLng latLng) async {
    final response = await APIProvider().request(
      domain: APIEndpoint.openWeather,
      path: 'onecall',
      method: HTTPMethod.get,
      query: {
        'lat': latLng.lat.toString(),
        'lon': latLng.lng.toString(),
        'exclude': 'minutely,alerts',
        'units': 'metric',
        'appid': AppConsts.appid,
      },
    );

    return OpenWeather.fromJson(response);
  }
}
