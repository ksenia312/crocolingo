import 'package:crocolingo/app/domain/language.dart';
import 'package:crocolingo/common/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class LanguageField extends StatelessWidget {
  const LanguageField({
    super.key,
    required this.hintText,
    required this.currentValue,
    this.emptyItemName = 'No language',
    this.onChanged,
    this.emptyItemColor,
  });

  final void Function(Language?)? onChanged;
  final Language? currentValue;
  final String hintText;
  final String emptyItemName;
  final Color? emptyItemColor;

  DropdownMenuItem<Language?> get noLanguage => DropdownMenuItem(
        value: null,
        child: Text(emptyItemName),
      );

  DropdownMenuItem<Language?> get selectedNoLanguage => DropdownMenuItem(
        value: null,
        child: Text(
          emptyItemName,
          style: TextStyle(color: emptyItemColor),
        ),
      );

  Iterable<DropdownMenuItem<Language?>> get languages => Language.values.map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e.previewName),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        //border: Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(6.0),
        color: context.colorScheme.tertiary
      ),
      child: DropdownButton<Language?>(
        hint: Text(hintText),
        style: context.textTheme.titleSmall,
        value: currentValue,
        isExpanded: true,
        borderRadius: BorderRadius.circular(6.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        underline: const SizedBox(),
        icon: const Icon(Icons.language),
        items: [noLanguage, ...languages],
        selectedItemBuilder: (context) => [selectedNoLanguage, ...languages],
        onChanged: onChanged,
      ),
    );
  }
}
