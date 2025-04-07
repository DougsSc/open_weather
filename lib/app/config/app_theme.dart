import 'package:flutter/material.dart';
import 'package:open_weather/app/config/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static Color primary = const Color(0xff1B3E67);
  static Color secondary = const Color(0xFF2D3748);
  static Color gray100 = const Color(0xffF7FAFC);
  static Color gray200 = const Color(0xffEDF2F7);
  static Color gray300 = const Color(0xffE2E8F0);
  static Color gray500 = const Color(0xffA0AEC0);
  static Color selectedColor = const Color(0xffF6AD55);

  static const TextStyle defaultTextStyle = TextStyle(
    fontSize: AppTextStyles.fsSmall,
    fontWeight: AppTextStyles.fwRegular,
    color: Color(0xff718096),
  );

  static ThemeData get light => ThemeData(
    useMaterial3: false,
    hintColor: const Color(0xffABABAB),
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    shadowColor: const Color(0xBFB2B2B2),
    scaffoldBackgroundColor: gray100,
    primaryColor: primary,
    indicatorColor: selectedColor,
    canvasColor: Colors.transparent,
    fontFamily: 'Archivo',
    textTheme: TextTheme(
      bodySmall: defaultTextStyle,
      bodyMedium: defaultTextStyle.copyWith(fontSize: AppTextStyles.fsNormal),
      bodyLarge: defaultTextStyle.copyWith(fontSize: AppTextStyles.fsBig),
    ).apply(bodyColor: defaultTextStyle.color, displayColor: defaultTextStyle.color),
  );
}
