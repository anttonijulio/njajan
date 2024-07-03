import 'package:flutter/material.dart';

import '../colors/colors.dart';

class AppTheme {
  AppTheme._();

  static const themeMode = ThemeMode.light;
  static final theme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
          Color.fromARGB(255, 250, 224, 216),
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColors.primary,
        ),
      ),
    ),
  );
}
