import 'dart:async';
import 'dart:io';

import 'package:crocolingo/app/domain/document_status.dart';
import 'package:crocolingo/app/domain/translation/response_models.dart';
import 'package:crocolingo/app/domain/translation/translation_model.dart';
import 'package:crocolingo/app/domain/translation/translation_provider.dart';
import 'package:crocolingo/features/document_translation/domain/document_translation_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DocumentTranslationModel extends LanguagesModel {
  DocumentTranslationModel(this._provider);

  final TranslationProvider _provider;
  DocumentTranslationState state = IdleDocumentTranslationState();
  DocumentResponseModel? documentData;

  @override
  bool get forceBlock => state.isLoading;

  @override
  bool get hasValue => state.value != null;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      final path = result.files.single.path;
      if (path != null) {
        state = IdleDocumentTranslationState(value: File(path));
        notifyListeners();
      }
    }
  }

  @override
  void translate() {
    if (!hasLanguages || forceBlock || !hasValue) return;

    state = LoadingDocumentTranslationState(
      value: state.value,
      status: DocumentStatus.queued,
    );
    notifyListeners();
    _provider
        .translateDocument(
      source: sourceLanguage,
      target: targetLanguage!,
      file: state.value!,
    )
        .then((data) {
      documentData = data;
      checkDocument();
    }).catchError((e, s) {
      debugPrint('$e $s');
      _setError();
    });
  }

  void downloadFile() {
    if (documentData != null) {
      state = LoadingDocumentTranslationState(
        status: DocumentStatus.downloading,
      );
      notifyListeners();
      _provider
          .downloadDocument(
        documentId: documentData!.documentId,
        documentKey: documentData!.documentKey,
      )
          .then((value) {
        state = ResultDocumentTranslationState(
          downloaded: value ? Downloaded.success : Downloaded.pending,
        );
        notifyListeners();
      }).catchError((e, s) {
        debugPrint('$e $s');
        state = ResultDocumentTranslationState(downloaded: Downloaded.error);
        notifyListeners();
      });
    }
  }

  void checkDocument() {
    if (documentData != null) {
      _provider
          .checkDocument(
            documentId: documentData!.documentId,
            documentKey: documentData!.documentKey,
          )
          .then(_handleStatus)
          .catchError(
        (e, s) {
          debugPrint('$e $s');
          _setError();
        },
      );
    }
  }

  void _handleStatus(DocumentStatusResponseModel response) {
    final status = response.status;
    switch (status) {
      case DocumentStatus.queued:
      case DocumentStatus.translating:
        _setLoading(status);
        Future.delayed(const Duration(seconds: 2), checkDocument);
        break;
      case DocumentStatus.done:
        state = ResultDocumentTranslationState();
        notifyListeners();
        break;
      case DocumentStatus.error:
        _setError();
        break;
      case DocumentStatus.downloading:
        break;
    }
  }

  void _setLoading(DocumentStatus status) {
    state = LoadingDocumentTranslationState(
      value: state.value,
      status: status,
    );
    notifyListeners();
  }

  void _setError() {
    state = ErrorDocumentTranslationState(error: 'Something went wrong..');
    notifyListeners();
  }
}
