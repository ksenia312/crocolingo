import 'package:crocolingo/features/text_translation/domain/text_translation_model.dart';
import 'package:flutter/material.dart';

class TextTranslationField extends StatefulWidget {
  const TextTranslationField({super.key, required this.model});

  final TextTranslationModel model;

  @override
  State<TextTranslationField> createState() => _TextTranslationFieldState();
}

class _TextTranslationFieldState extends State<TextTranslationField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.model.hasLanguages
        ? TextFormField(
            minLines: 5,
            maxLines: 5,
            controller: _controller,
            enabled: widget.model.hasLanguages && !widget.model.forceBlock,
            autofocus: false,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
              labelText: 'Text for translation',
              hintText: 'Enter text for translation',
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              suffixIcon: widget.model.hasValue
                  ? InkWell(
                      child: const Icon(Icons.clear),
                      onTap: () {
                        _controller.clear();
                        widget.model.setText(null);
                      },
                    )
                  : null,
            ),
            onChanged: widget.model.setText,
          )
        : const SizedBox();
  }
}
