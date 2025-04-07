import 'dart:async';

import 'package:get/get.dart';
import 'package:open_weather/data/models/cities.dart';
import 'package:open_weather/data/models/current.dart';
import 'package:open_weather/data/models/daily.dart';
import 'package:open_weather/data/models/open_weather.dart';
import 'package:open_weather/domain/usecases/fetch_weather_use_case.dart';

class WeatherController extends GetxController {
  WeatherController(this._weatherUseCase);

  final FetchWeatherUseCase _weatherUseCase;

  Current? current(Cities city) => _cityMap.value.containsKey(city) ? _cityMap.value[city]?.current : null;

  final hourly = Rx<List<Current>>([]);
  final dailies = Rx<List<Daily>>([]);

  final _cityMap = Rx<Map<Cities, OpenWeather?>>({});

  @override
  void onInit() async {
    super.onInit();

    await _fetchData();

    selectCity(Cities.values.first);

    Timer.periodic(Duration(minutes: 10), (_) async => await _fetchData());
  }

  FutureOr<void> _fetchData() async {
    for (final city in Cities.values) {
      await _fetchCity(city);
    }
  }

  FutureOr<void> _fetchCity(Cities city) async {
    final wrapper = await _weatherUseCase.execute(city.latLng);

    _cityMap.value = {..._cityMap.value, city: wrapper};
  }

  void selectCity(Cities city) {
    if (_cityMap.value.containsKey(city)) {
      final wrapper = _cityMap.value[city];

      hourly.value = wrapper?.hourly ?? [];
      dailies.value = wrapper?.daily ?? [];
    }
  }
}
