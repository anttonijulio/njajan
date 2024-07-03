// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/page/login_page.dart';
import '../../features/auth/presentation/page/register_page.dart';
import '../../features/auth/presentation/page/splash_page.dart';
import '../../features/main_page.dart';
import '../../features/payment/presentation/page/payment_method_page.dart';
import '../../features/profile/presentation/page/update_profile_page.dart';
import '../utils/colors/colors.dart';
import '../utils/helper/gap.dart';
import '../utils/strings/asset_strings.dart';

class AppRoute {
  AppRoute._();

  // path
  static const init = _Path.INIT;
  static const login = _Path.LOGIN;
  static const register = _Path.REGISTER;
  static const forgotPassword = _Path.FORGOT_PASSWORD;
  static const main = _Path.MAIN;
  static const updateProfile = _Path.UPDATE_PROFILE;
  static const paymentMethod = _Path.PAYMENT_METHOD;

  // generate route
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case init:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case main:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case updateProfile:
        final args = settings.arguments as UpdateProfileArgs;
        return MaterialPageRoute(builder: (_) => UpdateProfilePage(args: args));
      case paymentMethod:
        return MaterialPageRoute(builder: (_) => const PaymentMethodPage());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              backgroundColor: AppColors.primary,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetStrings.errorProfil,
                    width: 100,
                    height: 100,
                  ),
                  Gap.h(24),
                  const Text(
                    'INVALID ROUTE',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        );
    }
  }
}

class _Path {
  _Path._();

  // string path
  static const INIT = '/';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const MAIN = '/main';
  static const UPDATE_PROFILE = 'update-profile';
  static const PAYMENT_METHOD = '/payment-method';
}

class UpdateProfileArgs extends Equatable {
  final String avatar;
  final String email;
  final String username;

  const UpdateProfileArgs({
    required this.avatar,
    required this.email,
    required this.username,
  });

  @override
  List<Object?> get props => [];
}
