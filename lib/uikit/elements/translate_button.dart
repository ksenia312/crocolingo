import 'package:crocolingo/app/domain/translation/translation_model.dart';
import 'package:flutter/material.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({super.key, required this.model});

  final LanguagesModel model;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 200),
      child: ElevatedButton(
        onPressed: !model.forceBlock && model.hasValue && model.hasLanguages
            ? model.translate
            : null,
        child: const Text('Translate'),
      ),
    );
  }
}
