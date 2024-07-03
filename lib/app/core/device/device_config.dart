import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Device {
  Device._();

  // initConfig
  static void initConfig() {
    _setStatusBar();
    _setOrientation();
  }

  static void _setStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static void _setOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
