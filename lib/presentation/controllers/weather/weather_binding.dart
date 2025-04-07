import 'package:get/get.dart';
import 'package:open_weather/data/repositories/open_weather_repository.dart';
import 'package:open_weather/domain/usecases/fetch_weather_use_case.dart';
import 'package:open_weather/presentation/controllers/weather/weather_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchWeatherUseCase(Get.find<OpenWeatherRepositoryImpl>()));
    Get.lazyPut(() => WeatherController(Get.find()));
  }
}
