import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di/injector.dart ';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MyApp());
}
