import 'package:crocolingo/app/domain/app_config.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppConfig)
class LocalConfig extends AppConfig {
  LocalConfig()
      : super(
          apiKey: envApiKey,
          baseUrl: envBaseUrl,
        );

  static const envApiKey = String.fromEnvironment('API_KEY');
  static const envBaseUrl = String.fromEnvironment('BASE_URL');
}
