import 'package:flutter/material.dart';
import 'package:open_weather/app/config/app_text_styles.dart';

const int infiniteLines = -1;

class BaseLabel extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final Color? color;
  final int maxLines;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final EdgeInsets margin;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final double? height;

  const BaseLabel(
    this.text, {
    super.key,
    this.fontSize,
    this.textAlign,
    this.color,
    this.maxLines = 1,
    this.decoration,
    this.height,
    this.fontWeight = AppTextStyles.fwRegular,
    this.fontStyle = FontStyle.normal,
    this.overflow = TextOverflow.ellipsis,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      child: Text(
        text,
        maxLines: maxLines == infiniteLines ? null : maxLines,
        overflow: maxLines == infiniteLines ? null : overflow,
        textAlign: textAlign ?? TextAlign.start,
        softWrap: true,
        style: TextStyle(
          height: height,
          fontSize: fontSize ?? AppTextStyles.fsNormal,
          color: color ?? Theme.of(context).textTheme.bodyMedium!.color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          decoration: decoration,
          decorationThickness: 1.8,
        ),
      ),
    );
  }
}
