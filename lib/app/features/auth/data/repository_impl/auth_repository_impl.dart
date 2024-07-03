import 'package:fpdart/fpdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/utils/strings/app_string.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemote;
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final InternetConnectionChecker connection;

  AuthRepositoryImpl({
    required this.authRemote,
    required this.auth,
    required this.firestore,
    required this.connection,
  });

  //* login
  @override
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  }) async {
    if (!await connection.hasConnection) {
      return left(Failure(message: AppString.noConnection));
    }

    try {
      final userCredential = await authRemote.login(
        email: email,
        password: password,
      );

      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(Failure(message: e.code));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  //* register
  @override
  Future<Either<Failure, void>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    if (!await connection.hasConnection) {
      return left(Failure(message: AppString.noConnection));
    }

    try {
      await authRemote.register(
        username: username,
        email: email,
        password: password,
      );

      // kirim dan set data user ke firestore
      final user = auth.currentUser;
      if (user != null) {
        final now = DateTime.now();
        await user.updateDisplayName(username);
        await firestore.collection('user').doc(user.uid).set({
          'uid': user.uid,
          'name': username,
          'username': username,
          'password': password,
          'email': email,
          'avatar': '',
          'role': 'pembeli',
          'phoneNumber': '',
          'gender': '',
          'dateOfBirth': '',
          'address': '',
          'createdAt': now.toString(),
        });
      } else {
        return left(Failure(message: 'current user null'));
      }

      // logout dari user yang telah didaftarkan
      await authRemote.logout();

      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure(message: e.code));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  //* user authentication status
  @override
  bool userAuthStatus() {
    return authRemote.userIsExists();
  }

  //* logout
  @override
  Future<Either<Failure, void>> logout() async {
    if (!await connection.hasConnection) {
      return left(Failure(message: AppString.noConnection));
    }

    try {
      await Future.delayed(const Duration(seconds: 2), () {
        authRemote.logout();
      });
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure(message: e.code));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
