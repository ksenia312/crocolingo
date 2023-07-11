import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:crocolingo/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => context.pop(),
                splashRadius: 20.0,
                icon: Icon(
                  Icons.close,
                  color: context.colorScheme.onBackground,
                ),
              ),
            ),
            const _DrawerButton(
              label: 'Home',
              location: AppRoutes.home,
              icon: Icons.home_outlined,
            ),
            const SizedBox(height: 6.0),
            const _DrawerButton(
              label: 'Text Translation',
              location: AppRoutes.textTranslation,
              icon: Icons.translate_outlined,
            ),
            const SizedBox(height: 6.0),
            const _DrawerButton(
              label: 'Document Translation',
              location: AppRoutes.documentTranslation,
              icon: Icons.edit_document,
            ),
            const SizedBox(height: 50.0),
            Expanded(
              child: Transform.flip(
                flipX: true,
                child: ClipRect(
                  child: FractionalTranslation(
                    translation: const Offset(0.35, 0.0),
                    child: Crocodile.of(context),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    required this.label,
    required this.location,
    required this.icon,
  });

  final String label;
  final String location;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context).routerDelegate.currentConfiguration.last;
    final isCurrent = route.matchedLocation == location;
    final foreground = isCurrent
        ? context.colorScheme.primary
        : context.colorScheme.onBackground;
    return ListTile(
      tileColor: isCurrent ? context.currentTheme.hoverColor : null,
      onTap: () {
        context.pop();
        if (!isCurrent) context.push(location);
      },
      leading: Icon(icon, color: foreground),
      horizontalTitleGap: 0,
      title: Text(
        label,
        style: context.textTheme.titleSmall.withColor(foreground),
        textAlign: TextAlign.start,
      ),
    );
  }
}
