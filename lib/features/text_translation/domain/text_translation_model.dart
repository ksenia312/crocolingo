import 'package:crocolingo/app/domain/translation/translation_model.dart';
import 'package:crocolingo/app/domain/translation/translation_provider.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'text_translation_state.dart';

@Injectable()
class TextTranslationModel extends LanguagesModel {
  TextTranslationModel(this._provider);

  final TranslationProvider _provider;
  TextTranslationState state = IdleTextTranslationState();

  @override
  bool get forceBlock => state.isLoading;

  @override
  bool get hasValue => state.value?.isNotEmpty ?? false;

  @override
  void translate() {
    if (!hasLanguages || !hasValue || forceBlock) return;
    state = LoadingTextTranslationState(value: state.value);
    notifyListeners();
    _provider
        .translate(
      source: sourceLanguage,
      target: targetLanguage!,
      value: state.value!,
    )
        .then((response) {
      state = ResultTextTranslationState(
        value: state.value,
        result: response.result,
      );
      if (response.detectedLanguage != null) {
        sourceLanguage = response.detectedLanguage;
      }
      notifyListeners();
    }).catchError((e, s) {
      state = ErrorTextTranslationState(
        error: 'Something went wrong...',
      );
      debugPrint('$e $s');
      notifyListeners();
    });
  }

  void setText(String? value) {
    state = IdleTextTranslationState(value: value);
    notifyListeners();
  }
}
