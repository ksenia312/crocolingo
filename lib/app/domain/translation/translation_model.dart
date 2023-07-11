import 'package:flutter/material.dart';

import '../language.dart';

abstract class LanguagesModel extends ChangeNotifier {
  Language? sourceLanguage;
  Language? targetLanguage;

  bool get hasLanguages => targetLanguage != null;

  bool get forceBlock;

  bool get hasValue;

  void translate();

  void setSourceLanguage(Language? value) {
    sourceLanguage = value;
    notifyListeners();
  }

  void setTargetLanguage(Language? value) {
    targetLanguage = value;
    notifyListeners();
  }
}
