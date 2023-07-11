import 'package:crocolingo/gen/assets.gen.dart';
import 'package:crocolingo/uikit/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension ThemeExtension on BuildContext {
  AppTheme get appTheme => watch<AppTheme>();

  ThemeData get currentTheme => appTheme.current;

  ColorScheme get colorScheme => appTheme.current.colorScheme;

  TextTheme get textTheme => appTheme.current.textTheme;
}

extension ColorExtension on TextStyle? {
  TextStyle? withColor(Color color) =>
      this != null ? this!.copyWith(color: color) : null;
}

abstract class Crocodile {
  static Widget of(BuildContext context, {double? width}) =>
      context.appTheme.themeMode == ThemeMode.light
          ? Assets.svg.crocodileLight.svg(width: width, )
          : Assets.svg.crocodileDark.svg(width: width);
}
