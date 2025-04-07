import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_weather/app/config/app_theme.dart';
import 'package:open_weather/app/services/connective_service.dart';
import 'package:open_weather/app/services/local_storage.dart';
import 'package:open_weather/data/repositories/open_weather_repository.dart';
import 'package:open_weather/presentation/controllers/weather/weather_binding.dart';
import 'package:open_weather/presentation/pages/home/home_page.dart';

void main() async {
  Get.lazyPut(() => OpenWeatherRepositoryImpl());
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(App());
}

Future<void> initServices() async {
  debugPrint('starting services ...');
  await Get.putAsync(() => LocalStorageService().init());
  await Get.putAsync(() => ConnectiveService().init());
  debugPrint('All services started...');
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
