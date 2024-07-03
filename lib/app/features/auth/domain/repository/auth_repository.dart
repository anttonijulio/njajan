import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failure.dart';

abstract interface class AuthRepository {
  // login
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  });

  // register
  Future<Either<Failure, void>> register({
    required String username,
    required String email,
    required String password,
  });

  // user sudah login atau belum
  bool userAuthStatus();

  // logout
  Future<Either<Failure, void>> logout();
}
