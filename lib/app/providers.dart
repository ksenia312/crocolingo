import 'package:crocolingo/di/get_it.dart';
import 'package:crocolingo/uikit/theme/theme.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider(
    create: (_) => getIt<AppTheme>(),
  ),
];
