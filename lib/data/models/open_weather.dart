import 'package:open_weather/data/models/current.dart';
import 'package:open_weather/data/models/daily.dart';

class OpenWeather {
  const OpenWeather({required this.current, required this.hourly, required this.daily});

  final Current? current;
  final List<Current> hourly;
  final List<Daily> daily;

  factory OpenWeather.fromJson(Map<String, dynamic> json) {
    return OpenWeather(
      current: json["current"] == null ? null : Current.fromJson(json["current"]),
      hourly: json["hourly"] == null ? [] : List<Current>.from(json["hourly"]!.map((x) => Current.fromJson(x))),
      daily: json["daily"] == null ? [] : List<Daily>.from(json["daily"]!.map((x) => Daily.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "current": current?.toJson(),
    "hourly": hourly.map((x) => x.toJson()).toList(),
    "daily": daily.map((x) => x.toJson()).toList(),
  };
}
