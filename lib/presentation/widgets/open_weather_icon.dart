import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_weather/app/config/app_theme.dart';

class OpenWeatherIcon extends StatelessWidget {
  const OpenWeatherIcon({super.key, required this.name, this.color});

  final String? name;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 40,
      width: 40,
      imageUrl: "https://openweathermap.org/img/wn/$name.png",
      color: color,
      progressIndicatorBuilder:
          (_, __, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Container(height: 40, width: 40, color: Colors.transparent),
    );
  }
}
