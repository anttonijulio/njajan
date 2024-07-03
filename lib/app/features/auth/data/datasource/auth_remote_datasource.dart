import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDatasource {
  // login
  Future<UserCredential> login({
    required String email,
    required String password,
  });

  // register
  Future<void> register({
    required String username,
    required String email,
    required String password,
  });

  // user is exists
  bool userIsExists();

  // logout
  Future<void> logout();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseAuth auth;

  AuthRemoteDatasourceImpl({required this.auth});

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  bool userIsExists() {
    return auth.currentUser != null;
  }
}
