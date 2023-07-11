
import 'package:crocolingo/app/providers.dart';
import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:crocolingo/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            routerConfig: router,
            title: 'Translator',
            debugShowCheckedModeBanner: false,
            themeMode: context.appTheme.themeMode,
            theme: context.currentTheme,
          );
        },
      ),
    );
  }
}
