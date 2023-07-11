import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:crocolingo/router/router.dart';
import 'package:crocolingo/uikit/app_bar.dart';
import 'package:crocolingo/uikit/elements/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar.of(context),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome',
              style: context.textTheme.displayMedium.withColor(
                context.colorScheme.primary,
              ),
            ),
            const SizedBox(
              height: 45.0,
            ),
            const LogoAnimation(),
            const SizedBox(
              height: 45.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(46.0),
                ),
                child: Text(
                  'Start translating',
                  style: context.textTheme.titleMedium.withColor(
                    context.colorScheme.onPrimary,
                  ),
                ),
                onPressed: () => context.push(AppRoutes.textTranslation),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LogoAnimation extends StatefulWidget {
  const LogoAnimation({super.key});

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  late final _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 8))
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Crocodile.of(context),
    );
  }
}
