import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocale {
  AppLocale._();

  static const locale = Locale('id');
  static const supportLocales = <Locale>[
    Locale('en', 'US'),
    Locale('id', 'ID'),
  ];
  static const localizationDelegates = <LocalizationsDelegate>[
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
