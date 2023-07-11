enum Language {
  bg, // Bulgarian
  cs, // Czech
  da, // Danish
  de, // German
  el, // Greek
  en, // English
  es, // Spanish
  et, // Estonian
  fi, // Finnish
  fr, // French
  hu, // Hungarian
  id, // Indonesian
  it, // Italian
  ja, // Japanese
  ko, // Korean
  lt, // Lithuanian
  lv, // Latvian
  nb, // Norwegian (Bokmål)
  nl, // Dutch
  pl, // Polish
  pt, // Portuguese (all Portuguese varieties mixed)
  ro, // Romanian
  ru, // Russian
  sk, // Slovak
  sl, // Slovenian
  sv, // Swedish
  tr, // Turkish
  uk, // Ukrainian
  zh, // Chinese
}

extension LanguageWorker on Language {
  static Language? fromString(String name) {
    for (final language in Language.values) {
      if (language.name == name.toLowerCase()) {
        return language;
      }
    }
    return null;
  }

  String get previewName {
    switch (this) {
      case Language.bg:
        return 'Bulgarian';
      case Language.cs:
        return 'Czech';
      case Language.da:
        return 'Danish';
      case Language.de:
        return 'German';
      case Language.el:
        return 'Greek';
      case Language.en:
        return 'English';
      case Language.es:
        return 'Spanish';
      case Language.et:
        return 'Estonian';
      case Language.fi:
        return 'Finnish';
      case Language.fr:
        return 'French';
      case Language.hu:
        return 'Hungarian';
      case Language.id:
        return 'Indonesian';
      case Language.it:
        return 'Italian';
      case Language.ja:
        return 'Japanese';
      case Language.ko:
        return 'Korean';
      case Language.lt:
        return 'Lithuanian';
      case Language.lv:
        return 'Latvian';
      case Language.nb:
        return 'Norwegian (Bokmål)';
      case Language.nl:
        return 'Dutch';
      case Language.pl:
        return 'Polish';
      case Language.pt:
        return 'Portuguese (all Portuguese varieties mixed)';
      case Language.ro:
        return 'Romanian';
      case Language.ru:
        return 'Russian';
      case Language.sk:
        return 'Slovak';
      case Language.sl:
        return 'Slovenian';
      case Language.sv:
        return 'Swedish';
      case Language.tr:
        return 'Turkish';
      case Language.uk:
        return 'Ukrainian';
      case Language.zh:
        return 'Chinese';
      default:
        return '';
    }
  }
}
