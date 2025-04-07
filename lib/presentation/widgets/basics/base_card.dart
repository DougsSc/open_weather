import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onTap;
  final double? width;

  const BaseCard({
    super.key,
    this.child,
    this.padding,
    this.color = Colors.white,
    this.decoration,
    this.onTap,
    this.margin,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    Widget widget = Material(child: Container(padding: padding, child: child));

    if (onTap != null) {
      widget = Material(
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: widget,
        ),
      );
    }

    widget = Container(
      decoration: decoration ?? BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(4))),
      margin: margin,
      width: width,
      child: widget,
    );

    return widget;
  }
}
