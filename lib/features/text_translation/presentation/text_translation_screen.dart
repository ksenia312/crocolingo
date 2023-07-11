import 'package:crocolingo/features/text_translation/presentation/components/text_translation_body.dart';
import 'package:crocolingo/uikit/app_bar.dart';
import 'package:crocolingo/uikit/elements/app_drawer.dart';
import 'package:flutter/material.dart';

class TextTranslationScreen extends StatefulWidget {
  const TextTranslationScreen({super.key});

  @override
  State<TextTranslationScreen> createState() => _TextTranslationScreenState();
}

class _TextTranslationScreenState extends State<TextTranslationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: BasicAppBar.of(
        context,
        title: const Text('Text Translation'),
      ),
      body: const TextTranslationBody(),
    );
  }
}
