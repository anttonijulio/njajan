import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // main
  static const primary = Color(0xFFF87146);
  static const secondary = Color(0xFF332C45);

  // sematic
  static const error = Color(0xFFE53935);
  static const warning = Color(0xFFFACC15);
  static const success = Color(0xFF3D843C);

  // base
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const begieColored = Color(0xFFFFF9EB);
  static const grey = Color(0xFFF2F2F2);

  // neutral
  static const grayScale10 = Color(0xFFFDFDFD);
  static const grayScale20 = Color(0xFFECF1F6);
  static const grayScale30 = Color(0xFFE3E9ED);
  static const grayScale40 = Color(0xFFD1D8DD);
  static const grayScale50 = Color(0xFFBFC6CC);
  static const grayScale60 = Color(0xFF9CA4AB);
  static const grayScale70 = Color(0xFF78828A);
  static const grayScale80 = Color(0xFF66707A);
  static const grayScale90 = Color(0xFF434E58);
  static const grayScale100 = Color(0xFF171725);
}

const ColorScheme scheme = ColorScheme(
  surface: Color(0xFFFFFFFF),
  primary: Color(0xFFC63065),
  secondary: Color(0xFF1E1E1E),
  onSurface: Color(0xFF1E1E1E),
  onPrimary: Color(0xFFFFFFFF),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFE74C3C),
  onError: Color(0xFFFFFFFF),
  brightness: Brightness.light,
);
