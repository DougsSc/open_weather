import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_weather/app/config/app_text_styles.dart';
import 'package:open_weather/app/config/app_theme.dart';
import 'package:open_weather/presentation/widgets/basics/base_label.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key});

  @override
  Size get preferredSize => Size(double.infinity, 104);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SvgPicture.asset('assets/icons/logo.svg', height: 40, width: 40),
      ),
      middle: BaseLabel(
        'Weather',
        fontSize: AppTextStyles.fsVeryBig,
        fontWeight: AppTextStyles.fwExtraBold,
        textAlign: TextAlign.center,
        color: AppTheme.secondary,
      ),
    );
  }
}
