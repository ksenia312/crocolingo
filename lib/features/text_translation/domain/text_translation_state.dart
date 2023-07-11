import 'package:crocolingo/app/domain/translation/translation_state.dart';

class TextTranslationState extends TranslationState<String, String> {
  TextTranslationState({super.value});

  @override
  bool get isLoading => this is LoadingTextTranslationState;

  @override
  bool get isIdle => this is IdleTextTranslationState;

  @override
  bool get isResult => this is ResultTextTranslationState;

  @override
  bool get isError => this is ErrorTextTranslationState;

  @override
  String errorBuilder() {
    return (this as ErrorTextTranslationState).error;
  }

  @override
  String resultBuilder() {
    return (this as ResultTextTranslationState).result ?? '';
  }

  @override
  String? loadingBuilder() => 'Translating ${value ?? '∅'}...';
}

class IdleTextTranslationState extends TextTranslationState {
  IdleTextTranslationState({super.value});
}

class ResultTextTranslationState extends TextTranslationState {
  ResultTextTranslationState({super.value, this.result});

  final String? result;
}

class LoadingTextTranslationState extends TextTranslationState {
  LoadingTextTranslationState({super.value});
}

class ErrorTextTranslationState extends TextTranslationState {
  ErrorTextTranslationState({required this.error});

  final String error;
}
