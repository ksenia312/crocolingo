import 'package:collection/collection.dart';
import 'package:crocolingo/common/extensions/font_extension.dart';
import 'package:crocolingo/di/get_it.dart';
import 'package:crocolingo/uikit/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode { light, dark }

extension on AppThemeMode {
  AppThemeMode toggle() {
    switch (this) {
      case AppThemeMode.light:
        return AppThemeMode.dark;
      case AppThemeMode.dark:
        return AppThemeMode.light;
    }
  }
}

final _textTheme = TextTheme(
  displayLarge: const TextStyle(fontSize: 48).lato(),
  displayMedium: const TextStyle(fontSize: 36).lato(),
  displaySmall: const TextStyle(fontSize: 32).lato(),
  titleLarge: const TextStyle(fontSize: 20).lato(),
  titleMedium: const TextStyle(fontSize: 18).lato(),
  titleSmall: const TextStyle(fontSize: 16).lato(),
  bodyLarge: const TextStyle(fontSize: 14).lato(),
  bodyMedium: const TextStyle(fontSize: 12).lato(),
  bodySmall: const TextStyle(fontSize: 8),
);

final _lightData = ThemeData(
  textTheme: _textTheme,
  drawerTheme: const DrawerThemeData(backgroundColor: AppColors.white),
  hoverColor: AppColors.greenLight,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: AppColors.greenPaleLight,
      disabledForegroundColor: AppColors.greenPale,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.green,
    onPrimary: AppColors.white,
    secondary: AppColors.aqua,
    tertiary: AppColors.lightGrey,
    outline: AppColors.grey,
  ),
);

final _darkData = ThemeData(
  textTheme: _textTheme,
  drawerTheme: const DrawerThemeData(backgroundColor: AppColors.greenDark),
  scaffoldBackgroundColor: AppColors.greensSemiDark,
  canvasColor: AppColors.greenDarker,
  hoverColor: AppColors.greensSemiDark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.white,
    onPrimary: AppColors.black,
    secondary: AppColors.aquaLight,
    surface: AppColors.greenDark,
    onSurface: AppColors.white,
    error: AppColors.lightGrey,
    tertiary: AppColors.greenDark50,
    outline: AppColors.green,
  ),
);

class AppTheme extends ChangeNotifier {
  AppTheme.initialized({required this.themeData, required this.darkThemeData}) {
    init();
  }

  static const key = 'app_theme';

  final ThemeData themeData;
  final ThemeData darkThemeData;

  AppThemeMode mode = AppThemeMode.light;

  void init() {
    SharedPreferences.getInstance().then((prefs) {
      final saved = prefs.getString(key);
      if (saved != null) {
        final value = AppThemeMode.values.firstWhereOrNull(
          (e) => e.name == saved,
        );
        if (value != null) {
          mode = value;
        }
      }
    });
  }

  void toggle() {
    mode = mode.toggle();
    notifyListeners();
    getIt<SharedPreferences>().setString(key, mode.name);
  }

  ThemeMode get themeMode {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
    }
  }

  ThemeData get current {
    switch (mode) {
      case AppThemeMode.light:
        return themeData;
      case AppThemeMode.dark:
        return darkThemeData;
    }
  }
}

@Singleton(as: AppTheme)
class MainTheme extends AppTheme {
  MainTheme()
      : super.initialized(
          themeData: _lightData,
          darkThemeData: _darkData,
        );
}
