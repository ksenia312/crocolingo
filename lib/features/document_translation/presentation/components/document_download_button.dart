import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:crocolingo/features/document_translation/domain/document_translation_model.dart';
import 'package:crocolingo/features/document_translation/domain/document_translation_state.dart';
import 'package:crocolingo/uikit/buttons/icon_text_button.dart';
import 'package:flutter/material.dart';

class DocumentDownloadButton extends StatelessWidget {
  const DocumentDownloadButton({
    super.key,
    required this.model,
    required this.downloaded,
  });

  final DocumentTranslationModel model;
  final Downloaded downloaded;

  @override
  Widget build(BuildContext context) {
    return IconTextButton(
      title: title,
      icon: icon,
      mainColor: getMainColor(context),
      onPressed: !model.forceBlock && downloaded == Downloaded.pending
          ? model.downloadFile
          : null,
    );
  }

  String get title {
    switch (downloaded) {
      case Downloaded.success:
        return 'Successfully!';
      case Downloaded.error:
        return 'Attempt failed';
      case Downloaded.pending:
        return 'Download file';
    }
  }

  Icon? get icon {
    switch (downloaded) {
      case Downloaded.success:
        return null;
      case Downloaded.error:
        return const Icon(Icons.error_outline);
      case Downloaded.pending:
        return const Icon(Icons.file_download);
    }
  }

  Color? getMainColor(BuildContext context) {
    switch (downloaded) {
      case Downloaded.success:
        return context.colorScheme.outline;
      case Downloaded.error:
        return context.colorScheme.error;
      case Downloaded.pending:
        return null;
    }
  }
}
