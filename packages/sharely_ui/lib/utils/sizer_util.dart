import 'package:flutter/material.dart';

class SizerUtil {
  SizerUtil({required this.context});

  final BuildContext context;

  double fullWidth() => MediaQuery.of(context).size.width;

  double fullHeight() => MediaQuery.of(context).size.height;

  double width(double value) => fullWidth() * value;

  double height(double value) => fullHeight() * value;

  EdgeInsets fromLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      EdgeInsets.fromLTRB(
        fullWidth() * left,
        fullWidth() * top,
        fullWidth() * right,
        fullWidth() * bottom,
      );

  EdgeInsets symmetric(
    double horizontal,
    double vertical,
  ) =>
      EdgeInsets.symmetric(
        vertical: fullWidth() * vertical,
        horizontal: fullWidth() * horizontal,
      );

  EdgeInsets all(double value) => EdgeInsets.all(
        fullWidth() * value,
      );

  EdgeInsets horizontal(double value) => EdgeInsets.symmetric(
        horizontal: fullWidth() * value,
      );

  EdgeInsets vertical(double value) => EdgeInsets.symmetric(
        vertical: fullWidth() * value,
      );

  EdgeInsets top(double value) => EdgeInsets.only(
        top: fullWidth() * value,
      );

  EdgeInsets left(double value) => EdgeInsets.only(
        left: fullWidth() * value,
      );

  EdgeInsets right(double value) => EdgeInsets.only(
        right: fullWidth() * value,
      );

  EdgeInsets bottom(double value) => EdgeInsets.only(
        bottom: fullWidth() * value,
      );

  BorderRadius borderRadius(double radius) => BorderRadius.all(Radius.circular(fullWidth() * radius));
}
