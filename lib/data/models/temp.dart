class Temp {
  const Temp({required this.min, required this.max});

  final num? min;
  final num? max;

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(min: json["min"], max: json["max"]);
  }

  Map<String, dynamic> toJson() => {"min": min, "max": max};
}
