import 'dart:async';
import 'dart:io';

import '../language.dart';
import 'response_models.dart';

abstract class TranslationProvider {
  Future<TextResponseModel> translate({
    required Language? source,
    required Language target,
    required String value,
  });

  Future<DocumentResponseModel> translateDocument({
    required Language? source,
    required Language target,
    required File file,
  });

  Future<DocumentStatusResponseModel> checkDocument({
    required String documentId,
    required String documentKey,
  });

  Future<bool> downloadDocument({
    required String documentId,
    required String documentKey,
  });
}
