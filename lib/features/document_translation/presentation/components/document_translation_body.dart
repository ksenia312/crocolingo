import 'package:crocolingo/di/get_it.dart';
import 'package:crocolingo/features/document_translation/domain/document_translation_model.dart';
import 'package:crocolingo/features/document_translation/presentation/components/document_translation_preview.dart';
import 'package:crocolingo/uikit/elements/languages_section.dart';
import 'package:crocolingo/uikit/elements/translate_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DocumentTranslationBody extends StatelessWidget {
  const DocumentTranslationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<DocumentTranslationModel>(),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Consumer<DocumentTranslationModel>(
          builder: (context, model, _) {
            return Column(
              children: [
                LanguagesSection(model: model),
                const SizedBox(height: 32.0),
                Expanded(
                  child: DocumentTranslationPreview(model: model),
                ),
                TranslateButton(model: model),
              ],
            );
          },
        ),
      ),
    );
  }
}
