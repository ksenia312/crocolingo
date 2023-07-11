import 'package:crocolingo/app/my_app.dart';
import 'package:flutter/material.dart';

import 'di/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}
