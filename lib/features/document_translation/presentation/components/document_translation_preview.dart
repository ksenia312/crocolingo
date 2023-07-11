import 'package:crocolingo/app/domain/translation/translation_state.dart';
import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:crocolingo/features/document_translation/domain/document_translation_model.dart';
import 'package:crocolingo/features/document_translation/presentation/components/document_download_button.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'document_pick_button.dart';

class DocumentTranslationPreview extends StatelessWidget {
  const DocumentTranslationPreview({super.key, required this.model});

  final DocumentTranslationModel model;

  @override
  Widget build(BuildContext context) {
    return model.state.when(
      onIdle: () {
        final path = model.state.value?.path;
        return model.hasLanguages
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DocumentPickButton(model: model),
                  if (model.hasValue)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Selected: ${path != null ? basename(path) : ' '}',
                        style: context.textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              )
            : Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Choose target language to pick a file',
                  style: context.textTheme.titleSmall,
                ),
              );
      },
      onLoading: (status) => TranslationState.buildDefaultLoading(
        context,
        status,
      ),
      onResult: (downloaded) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DocumentDownloadButton(model: model, downloaded: downloaded),
            const SizedBox(height: 8.0),
            DocumentPickButton(model: model),
          ],
        );
      },
      onError: (error) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TranslationState.buildDefaultError(
            context,
            error,
          ),
          const SizedBox(height: 8.0),
          DocumentPickButton(model: model),
        ],
      ),
    );
  }
}
