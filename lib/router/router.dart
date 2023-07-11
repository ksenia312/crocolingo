// GoRouter configuration
import 'package:crocolingo/features/document_translation/presentation/document_translation_screen.dart';
import 'package:crocolingo/features/text_translation/presentation/text_translation_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.textTranslation,
      builder: (_, __) => const TextTranslationScreen(),
    ),
    GoRoute(
      path: AppRoutes.documentTranslation,
      builder: (_, __) => const DocumentTranslationScreen(),
    ),
  ],
);

abstract class AppRoutes {
  static const home = '/';
  static const textTranslation = '/text-translation';
  static const documentTranslation = '/document-translation';
}
