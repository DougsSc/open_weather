# open_weather

A simple weather App created using [Flutter](https://flutter.dev/) and [Dart](https://dart.dev/) and using API from [OpenWeatherMap](https://openweathermap.org/api)</br>

**This project was a mobile challenge for [ProjectMark](https://www.projectmark.com/). Following the [Google Doc](https://docs.google.com/document/d/1oTOpdeGt9of9KVDgSuzqzn8LXCw-t9AsAjsJnQTTIwQ/edit?usp=sharinghttps://docs.google.com/document/d/1oTOpdeGt9of9KVDgSuzqzn8LXCw-t9AsAjsJnQTTIwQ/edit?usp=sharing) prerequisites and the [Design Specifications](https://www.figma.com/design/oyLAeVhRkzPgoza0W0ZOj5/Mobile-Screen---ProjectMark?node-id=0-70&t=0ThlBG8ikmSenLIR-0) on Figma.**</br>

<img src="https://github.com/user-attachments/assets/40fcdfa7-777e-4a7d-80b6-6bd778b6ced9" width="20%"></img> 

## API Docs
> [!IMPORTANT]
> This project uses **_version One Call API 3.0_** of the OpenWeatherMap API</br>
> **API used in this project**:</br>
> - [One Call API Docs](https://openweathermap.org/api/one-call-3)</br>

## Features
- [x] Display the weather conditions for the following cities:
    - Joinville / SC (Brazil)
    - San Francisco / CA (USA)
    - Urubici / SC (Brazil)
- [x] Current temperature, humidity and pressure for the defined cities
- [x] Hourly weather information
- [x] 7 days weather information
- [x] Weather conditions update every 10 minutes
- [x] Local cache to access information when you are offline

## App Architecture

The app is composed using Clean Architecture.

<img src="https://github.com/user-attachments/assets/1e581a97-0c9c-4789-ad38-325a20b92da0" width="40%"></img> 

## Packages in use

- [GetX](https://pub.dev/packages/get) for state management
- [cached_network_image](https://pub.dev/packages/cached_network_image) for caching images
- [shared_preferences](https://pub.dev/packages/shared_preferences) for local storage
- [connectivity_plus](https://pub.dev/packages/connectivity_plus) to check the internet connectivity
- [flutter_svg](https://pub.dev/packages/flutter_svg) to load icons
- [carousel_slider](https://pub.dev/packages/carousel_slider) for carousel controll and animations

## How to Run
1. Create an account at [OpenWeatherMap](https://openweathermap.org/).
2. Then get your API key from https://home.openweathermap.org/api_keys.
   >Sometimes after getting your OpenWeatherMap API key it won't work right away </br>
   >To test if your API key is working or not copy and paste the following link to your browser</br>
   >https://api.openweathermap.org/data/3.0/onecall?lat=-26.3052&lon=-48.8493&appid=YOUR_API_KEY</br>
   >Then replace `YOUR_API_KEY` with your own API key from OpenWeatherMap
3. Clone the repo
   ```sh
   git clone https://github.com/DougsSc/open_weather.git
   ```
4. Install all the packages by typing
   ```sh
   flutter pub get
   ```
5. Navigate to [app_consts](lib/app/config/app_consts.dart) and paste your API key to the "appid" variable
   ```dart
   String appid = 'Paste Your API Key Here';
   ```
6. Run the App
