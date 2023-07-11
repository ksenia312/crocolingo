import 'dart:io';

import 'package:crocolingo/app/domain/document_status.dart';
import 'package:crocolingo/app/domain/translation/translation_state.dart';

class DocumentTranslationState extends TranslationState<File, Downloaded> {
  DocumentTranslationState({super.value});

  @override
  bool get isLoading => this is LoadingDocumentTranslationState;

  @override
  bool get isIdle => this is IdleDocumentTranslationState;

  @override
  bool get isResult => this is ResultDocumentTranslationState;

  @override
  bool get isError => this is ErrorDocumentTranslationState;

  @override
  String errorBuilder() {
    return (this as ErrorDocumentTranslationState).error;
  }

  @override
  Downloaded resultBuilder() {
    return (this as ResultDocumentTranslationState).downloaded;
  }

  @override
  String? loadingBuilder() {
    switch ((this as LoadingDocumentTranslationState).status) {
      case DocumentStatus.translating:
        return 'Almost done!';
      case DocumentStatus.done:
        return 'Done!';
      case DocumentStatus.queued:
        return 'Queued...';
      case DocumentStatus.error:
        return 'Oops';
      case DocumentStatus.downloading:
        return 'Downloading';
    }
  }
}

class IdleDocumentTranslationState extends DocumentTranslationState {
  IdleDocumentTranslationState({super.value});
}

enum Downloaded { success, error, pending }

class ResultDocumentTranslationState extends DocumentTranslationState {
  ResultDocumentTranslationState({this.downloaded = Downloaded.pending});

  final Downloaded downloaded;
}

class LoadingDocumentTranslationState extends DocumentTranslationState {
  LoadingDocumentTranslationState({
    super.value,
    required this.status,
  });

  final DocumentStatus status;
}

class ErrorDocumentTranslationState extends DocumentTranslationState {
  ErrorDocumentTranslationState({required this.error});

  final String error;
}
