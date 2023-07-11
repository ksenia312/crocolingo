// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../app/data/deepl_translation_provider.dart' as _i9;
import '../app/data/local_config.dart' as _i4;
import '../app/domain/app_config.dart' as _i3;
import '../app/domain/translation/translation_provider.dart' as _i8;
import '../features/document_translation/domain/document_translation_model.dart'
    as _i10;
import '../features/text_translation/domain/text_translation_model.dart'
    as _i11;
import '../uikit/theme/theme.dart' as _i5;
import 'dio_module.dart' as _i12;
import 'locale_storage_module.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final localeStorageModule = _$LocaleStorageModule();
    gh.singleton<_i3.AppConfig>(_i4.LocalConfig());
    gh.singleton<_i5.AppTheme>(_i5.MainTheme());
    gh.factory<_i6.Dio>(() => dioModule.getDio(gh<_i3.AppConfig>()));
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => localeStorageModule.prefs,
      preResolve: true,
    );
    gh.factory<_i8.TranslationProvider>(
        () => _i9.DeeplTranslationProvider(gh<_i6.Dio>()));
    gh.factory<_i10.DocumentTranslationModel>(
        () => _i10.DocumentTranslationModel(gh<_i8.TranslationProvider>()));
    gh.factory<_i11.TextTranslationModel>(
        () => _i11.TextTranslationModel(gh<_i8.TranslationProvider>()));
    return this;
  }
}

class _$DioModule extends _i12.DioModule {}

class _$LocaleStorageModule extends _i13.LocaleStorageModule {}
