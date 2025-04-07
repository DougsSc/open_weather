import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_weather/app/config/app_theme.dart';
import 'package:open_weather/data/repositories/open_weather_repository.dart';
import 'package:open_weather/presentation/controllers/weather/weather_binding.dart';
import 'package:open_weather/presentation/pages/home/home_page.dart';

void main() async {
  Get.lazyPut(() => OpenWeatherRepositoryImpl());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: "/",
      initialBinding: WeatherBinding(),
      home: HomePage(),
    );
  }
}
