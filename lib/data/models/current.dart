import 'package:open_weather/app/utilities/date_utilities.dart';
import 'package:open_weather/data/models/weather.dart';

class Current {
  const  Current({
    required this.dt,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.weather,
  });

  final DateTime? dt;
  final num? temp;
  final int? pressure;
  final int? humidity;
  final List<Weather> weather;

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      dt: DateUtilities.parse(json["dt"]),
      temp: json["temp"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      weather: json["weather"] == null ? [] : List<Weather>.from(json["weather"]!.map((x) => Weather.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "temp": temp,
    "pressure": pressure,
    "humidity": humidity,
    "weather": weather.map((x) => x.toJson()).toList(),
  };
}
