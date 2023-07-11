import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:crocolingo/di/get_it.dart';
import 'package:crocolingo/features/text_translation/domain/text_translation_model.dart';
import 'package:crocolingo/uikit/elements/languages_section.dart';
import 'package:crocolingo/uikit/elements/translate_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'text_translation_field.dart';
import 'text_translation_preview.dart';

class TextTranslationBody extends StatelessWidget {
  const TextTranslationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<TextTranslationModel>(),
      child: Consumer<TextTranslationModel>(
        builder: (context, model, _) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      LanguagesSection(model: model),
                      const SizedBox(height: 16.0),
                      TextTranslationField(model: model),
                      const SizedBox(height: 16.0),
                      TextTranslationPreview(model: model),
                    ],
                  ),
                ),
                Crocodile.of(context, width: 70),
                TranslateButton(model: model),
              ],
            ),
          );
        },
      ),
    );
  }
}
