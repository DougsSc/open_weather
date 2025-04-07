import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/data/models/lat_lng.dart';
import 'package:open_weather/domain/usecases/fetch_weather_use_case.dart';

import 'repositories/mock_weather_repository.dart';

void main() {
  test('Fetch weather test', () async {
    // Mock input
    final latLng = LatLng(-26.3052, -48.8493);

    // Mock data
    final fetchWeatherUseCase = FetchWeatherUseCase(MockWeatherRepository());
    final weather = await fetchWeatherUseCase.execute(latLng);

    // Verify that data has created.
    expect(DateFormat.j().format(weather.current!.dt!).toLowerCase().replaceAll(' ', ''), "1pm");
    expect(weather.current?.temp, isNotNull);
    expect(weather.current?.pressure, isNotNull);
    expect(weather.current?.humidity, isNotNull);
    expect(weather.current?.weather.length, 1);
  });
}
