class Weather {
  const Weather({required this.icon});

  final String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(icon: json["icon"]);
  }

  Map<String, dynamic> toJson() => {"icon": icon};
}
