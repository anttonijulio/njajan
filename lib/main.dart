import 'package:flutter/material.dart';
import 'package:njajan_app/di.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const App());
}
