import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/app/config/app_text_styles.dart';
import 'package:open_weather/app/config/app_theme.dart';
import 'package:open_weather/data/models/cities.dart';
import 'package:open_weather/presentation/controllers/weather/weather_controller.dart';
import 'package:open_weather/presentation/widgets/basics/base_card.dart';
import 'package:open_weather/presentation/widgets/basics/base_label.dart';
import 'package:open_weather/presentation/widgets/carousel_widget.dart';
import 'package:open_weather/presentation/widgets/open_weather_icon.dart';
import 'package:open_weather/presentation/widgets/weather_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherAppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 32),
          children: [
            CarouselWidget(
              height: 200,
              items: Cities.values.map((city) => _CityCard(city)).toList(),
              onChanged: (index) => Get.find<WeatherController>().selectCity(Cities.values[index]),
            ),
            const SizedBox(height: 32),
            _HourlyView(),
            const SizedBox(height: 32),
            _DailyView(),
          ],
        ),
      ),
    );
  }
}

class _CityCard extends GetView<WeatherController> {
  const _CityCard(this.city);

  final Cities city;

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      builder: (_) {
        final current = controller.current(city);
        final temp = (current?.temp ?? 0).round();

        return BaseCard(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors:
                  temp <= 5
                      ? [Color(0xFF53B6D7), Color(0xFF8ACDE2)]
                      : temp > 25
                      ? [Colors.red, Colors.redAccent]
                      : [Colors.orange, Colors.orangeAccent],
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseLabel(city.label, color: Colors.white, fontWeight: AppTextStyles.fwExtraBold),
              Spacer(),
              BaseLabel('$temp° C', color: Colors.white, fontWeight: AppTextStyles.fwExtraBold, fontSize: 42),
              Spacer(),
              BaseLabel('Humidity: ${(current?.humidity ?? 0)}%', fontSize: AppTextStyles.fsSmall, color: Colors.white),
              BaseLabel(
                'Pressure: ${(current?.pressure ?? 0)} hPa',
                fontSize: AppTextStyles.fsSmall,
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HourlyView extends GetView<WeatherController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, bottom: 20),
          child: BaseLabel('Today', fontSize: AppTextStyles.fsBig, fontWeight: AppTextStyles.fwExtraBold),
        ),
        GetX(
          init: controller,
          builder: (_) {
            final hourly = controller.hourly.value;

            return SizedBox(
              height: 126,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: hourly.length,
                itemBuilder: (context, index) {
                  final current = hourly[index];
                  final isNow = index == 0;

                  return BaseCard(
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    color: isNow ? AppTheme.selectedColor.withAlpha(25) : AppTheme.gray200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (current.dt != null)
                          BaseLabel(
                            isNow ? 'Now' : DateFormat.j().format(current.dt!).toLowerCase().removeAllWhitespace,
                            fontSize: AppTextStyles.fsSmall,
                            color: isNow ? AppTheme.selectedColor : AppTheme.gray500,
                          ),
                        const SizedBox(height: 16),
                        OpenWeatherIcon(name: current.weather.firstOrNull?.icon, color: AppTheme.selectedColor),
                        const SizedBox(height: 16),
                        BaseLabel(
                          '${(current.temp ?? 0).round()}° C',
                          fontSize: AppTextStyles.fsSmall,
                          color: isNow ? AppTheme.selectedColor : AppTheme.gray500,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _DailyView extends GetView<WeatherController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 20),
          child: BaseLabel('Next 7 Days', fontSize: AppTextStyles.fsBig, fontWeight: AppTextStyles.fwExtraBold),
        ),
        GetX(
          init: controller,
          builder: (_) {
            final dailies = controller.dailies.value;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dailies.length,
              itemBuilder: (context, index) {
                final daily = dailies[index];

                return Row(
                  children: [
                    Expanded(flex: 3, child: BaseLabel(daily.dt != null ? DateFormat.EEEE().format(daily.dt!) : '')),
                    OpenWeatherIcon(name: daily.weather.firstOrNull?.icon),
                    Expanded(
                      flex: 2,
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${daily.temp?.min?.round().toString() ?? ''}° / ',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(fontWeight: AppTextStyles.fwMedium),
                            ),
                            TextSpan(
                              text: '${daily.temp?.max?.round().toString() ?? ''}°',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: AppTextStyles.fwBold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
