import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextTranslationResult extends StatefulWidget {
  const TextTranslationResult({super.key, required this.result});

  final String result;

  @override
  State<TextTranslationResult> createState() => _TextTranslationResultState();
}

class _TextTranslationResultState extends State<TextTranslationResult> {
  bool copied = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 5,
      maxLines: 5,
      controller: TextEditingController(text: widget.result),
      decoration: InputDecoration(
        labelText: 'Result',
        labelStyle: TextStyle(color: context.colorScheme.primary),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colorScheme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colorScheme.primary,
          ),
        ),
        fillColor: context.currentTheme.hoverColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8.0,
        ),
        suffixIcon: InkWell(
          onTap: !copied ? copy : null,
          child: Icon(
            copied ? Icons.done_all : Icons.copy,
            color: context.colorScheme.primary,
          ),
        ),
      ),
      readOnly: true,
      style: TextStyle(color: context.colorScheme.primary),
    );
  }

  void copy() {
    Clipboard.setData(ClipboardData(text: widget.result)).then(
      (value) {
        setState(() {
          copied = true;
        });
        Future.delayed(
          const Duration(seconds: 1),
          () {
            if (mounted) {
              setState(() {
                copied = false;
              });
            }
          },
        );
      },
    );
  }
}
