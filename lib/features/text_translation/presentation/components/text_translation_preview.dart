import 'package:crocolingo/app/domain/translation/translation_state.dart';
import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:crocolingo/features/text_translation/domain/text_translation_model.dart';
import 'package:flutter/material.dart';

import 'text_translation_result.dart';

class TextTranslationPreview extends StatelessWidget {
  const TextTranslationPreview({super.key, required this.model});

  final TextTranslationModel model;

  @override
  Widget build(BuildContext context) {
    return model.state.when(
      onIdle: () => Text(
        !model.hasLanguages ? 'Choose target language to enter the text' : '',
        style: context.textTheme.titleSmall,
      ),
      onLoading: (status) => TranslationState.buildDefaultLoading(
        context,
        status,
      ),
      onResult: (result) => TextTranslationResult(
        result: result,
      ),
      onError: (error) => TranslationState.buildDefaultError(
        context,
        error,
      ),
    );
  }
}
