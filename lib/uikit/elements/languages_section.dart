import 'package:crocolingo/app/domain/translation/translation_model.dart';
import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:crocolingo/uikit/fields/language_field.dart';
import 'package:flutter/material.dart';

class LanguagesSection extends StatelessWidget {
  const LanguagesSection({super.key, required this.model});

  final LanguagesModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Source language',
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(height: 4.0),
        LanguageField(
          hintText: 'Source language',
          currentValue: model.sourceLanguage,
          emptyItemName: 'Auto',
          onChanged: !model.forceBlock ? model.setSourceLanguage : null,
        ),
        const SizedBox(height: 16.0),
        Text(
          'Target language',
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(height: 4.0),
        LanguageField(
          hintText: 'Target language',
          currentValue: model.targetLanguage,
          emptyItemColor: context.colorScheme.error,
          onChanged: !model.forceBlock ? model.setTargetLanguage : null,
        ),
      ],
    );
  }
}
