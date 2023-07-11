import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:crocolingo/uikit/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, theme, _) {
        return IconButton(
          onPressed: context.appTheme.toggle,
          icon: Icon(
            theme.mode == AppThemeMode.dark
                ? Icons.nightlight
                : Icons.nightlight_outlined,
          ),
        );
      },
    );
  }
}
