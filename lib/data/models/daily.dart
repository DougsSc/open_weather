import 'package:open_weather/app/utilities/date_utilities.dart';
import 'package:open_weather/data/models/temp.dart';
import 'package:open_weather/data/models/weather.dart';

class Daily {
  const Daily({required this.dt, required this.summary, required this.temp, required this.weather});

  final DateTime? dt;
  final String? summary;
  final Temp? temp;
  final List<Weather> weather;

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      dt: DateUtilities.parse(json["dt"]),
      summary: json["summary"],
      temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
      weather: json["weather"] == null ? [] : List<Weather>.from(json["weather"]!.map((x) => Weather.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "dt": DateUtilities.toInt(dt),
    "summary": summary,
    "temp": temp?.toJson(),
    "weather": weather.map((x) => x.toJson()).toList(),
  };
}
