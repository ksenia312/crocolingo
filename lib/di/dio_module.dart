import 'package:crocolingo/app/domain/app_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  Dio getDio(AppConfig config) {
    return Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        headers: {
          'Authorization': 'DeepL-Auth-Key ${config.apiKey}',
        },
      ),
    );
  }
}
