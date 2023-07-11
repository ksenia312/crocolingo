import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:crocolingo/features/document_translation/domain/document_translation_model.dart';
import 'package:crocolingo/uikit/buttons/icon_text_button.dart';
import 'package:flutter/material.dart';

class DocumentPickButton extends StatelessWidget {
  const DocumentPickButton({super.key, required this.model});

  final DocumentTranslationModel model;

  bool get isRestart => model.hasValue || model.state.isResult;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: IconTextButton(
        onPressed: !model.forceBlock ? model.pickFile : null,
        title: label,
        mainColor: isRestart ? context.colorScheme.secondary : null,
        icon: Icon(
          isRestart ? Icons.change_circle_outlined : Icons.file_upload,
        ),
      ),
    );
  }

  String get label {
    if (isRestart) {
      return 'Pick another file';
    }
    return 'Pick a file';
  }
}
