import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
    this.mainColor,
  });

  final Widget? icon;
  final String title;
  final VoidCallback? onPressed;
  final Color? mainColor;

  @override
  Widget build(BuildContext context) {
    final color = mainColor ?? context.colorScheme.primary;
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: color),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.textTheme.titleMedium.withColor(color),
            ),
            if (icon != null)
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  color,
                  BlendMode.srcATop,
                ),
                child: icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
