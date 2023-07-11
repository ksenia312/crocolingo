import '../document_status.dart';
import '../language.dart';

class TextResponseModel {
  TextResponseModel({required this.translations});

  final List translations;

  factory TextResponseModel.fromJson(Map<String, dynamic>? data) {
    return TextResponseModel(
      translations: data?['translations'] as List? ?? [],
    );
  }

  String get result =>
      translations.isNotEmpty ? (translations.first as Map)['text'] : '';

  String get detected => translations.isNotEmpty
      ? (translations.first as Map)['detected_source_language']
      : '';

  Language? get detectedLanguage => LanguageWorker.fromString(detected);
}

class DocumentResponseModel {
  DocumentResponseModel({
    required this.documentId,
    required this.documentKey,
  });

  final String documentId;
  final String documentKey;

  factory DocumentResponseModel.fromJson(Map<String, dynamic>? data) {
    return DocumentResponseModel(
      documentId: data?['document_id'] as String? ?? '',
      documentKey: data?['document_key'] as String? ?? '',
    );
  }
}

class DocumentStatusResponseModel {
  DocumentStatusResponseModel({
    required this.remaining,
    required this.status,
  });

  final int? remaining;
  final DocumentStatus status;

  factory DocumentStatusResponseModel.fromJson(Map<String, dynamic>? data) {
    return DocumentStatusResponseModel(
      remaining: data?['seconds_remaining'] as int?,
      status: DocumentStatusWorker.fromString(data?['status'] as String? ?? ''),
    );
  }
}
