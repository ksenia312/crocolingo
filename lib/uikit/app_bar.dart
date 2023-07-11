import 'package:flutter/material.dart';

import 'elements/switch_theme_button.dart';

abstract class BasicAppBar {
  static PreferredSizeWidget of(
    BuildContext context, {
    Widget title = const Text('CrocoLingo'),
    double elevation = 0,
  }) {
    return AppBar(
      title: title,
      elevation: 0,
      actions: const [SwitchThemeButton()],
    );
  }
}
