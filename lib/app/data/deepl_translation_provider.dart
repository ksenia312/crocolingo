import 'dart:async';
import 'dart:io';

import 'package:crocolingo/app/domain/translation/response_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../domain/language.dart';
import '../domain/translation/translation_provider.dart';

@Injectable(as: TranslationProvider)
class DeeplTranslationProvider extends TranslationProvider {
  DeeplTranslationProvider(this.dio);

  final Dio dio;

  @override
  Future<TextResponseModel> translate({
    required Language? source,
    required Language target,
    required String value,
  }) async {
    final response = await dio.post(
      '/v2/translate',
      data: {
        'text': [value..replaceAll(' ', '%%2C%20')],
        'target_lang': target.name.toUpperCase(),
        if (source != null) 'source_lang': source.name.toUpperCase(),
      },
    );
    return TextResponseModel.fromJson(
      response.data as Map<String, dynamic>?,
    );
  }

  @override
  Future<DocumentResponseModel> translateDocument({
    required Language? source,
    required Language target,
    required File file,
  }) async {
    final data = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
      'target_lang': target.name.toUpperCase(),
      if (source != null) 'source_lang': source.name.toUpperCase(),
    });
    final response = await dio.post(
      '/v2/document',
      data: data,
    );
    return DocumentResponseModel.fromJson(
      response.data as Map<String, dynamic>?,
    );
  }

  @override
  Future<DocumentStatusResponseModel> checkDocument({
    required String documentId,
    required String documentKey,
  }) async {
    final response = await dio.post(
      '/v2/document/$documentId',
      data: {'document_key': documentKey},
    );
    return DocumentStatusResponseModel.fromJson(response.data);
  }

  @override
  Future<bool> downloadDocument({
    required String documentId,
    required String documentKey,
  }) async {
    final path = await getDownloadPath();
    final now = DateTime.now();
    if (path != null && await _requestWritePermission()) {
      await dio.download(
        '/v2/document/$documentId/result',
        '$path/crocolingo-${now.year}${now.month}${now.day}-${now.hour}${now.minute}${now.second}.pdf',
        data: {'document_key': documentKey},
        options: Options(method: 'POST'),
      );
      return true;
    }
    return false;
  }

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!directory.existsSync()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } on Exception catch (e, s) {
      debugPrint('$e $s');
    }
    return directory?.path;
  }

  // requests storage permission
  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return Permission.storage.request().isGranted;
  }
}
