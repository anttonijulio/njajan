import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/utils/strings/app_string.dart';
import '../../domain/entity/profile.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasource/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final FirebaseAuth auth;
  final FirebaseStorage storage;
  final InternetConnectionChecker connection;
  final ProfileRemoteDatasource remoteProfile;

  ProfileRepositoryImpl({
    required this.auth,
    required this.storage,
    required this.connection,
    required this.remoteProfile,
  });

  //* get profile
  @override
  Future<Either<Failure, Profile>> getProfile() async {
    if (!await connection.hasConnection) {
      return left(Failure(message: AppString.noConnection));
    }

    try {
      final profile = await remoteProfile.getProfile();
      return right(profile);
    } on FirebaseException catch (e) {
      return left(Failure(message: e.message ?? '-'));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  //* update profile
  @override
  Future<Either<Failure, void>> updateProfile({
    required String avatarFilePath,
    required String name,
    required String phoneNumber,
    required String address,
    required String gender,
    required String dateOfBirth,
  }) async {
    if (!await connection.hasConnection) {
      return left(Failure(message: AppString.noConnection));
    }

    try {
      final user = auth.currentUser;

      if (user != null) {
        final uid = user.uid;
        final avatarFile = File(avatarFilePath);
        final ext = path.extension(avatarFilePath);

        final avatar = await _getUrlAvatarFromStorage(uid, ext, avatarFile);

        await remoteProfile.updateProfile(
          avatar: avatar,
          name: name,
          phoneNumber: phoneNumber,
          address: address,
          gender: gender,
          dateOfBirth: dateOfBirth,
        );
      } else {
        return left(Failure(message: 'NULL USER SAAT UPDATE PROFILE'));
      }

      return right(null);
    } on FirebaseException catch (e) {
      return left(Failure(message: e.message ?? '-'));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Future<String> _getUrlAvatarFromStorage(
    String uid,
    String ext,
    File avatarFile,
  ) async {
    try {
      // upload foto profile ke storage agar bisa dihosting
      _uploadAvatarToStorage(uid, ext, avatarFile);

      // download url foto profile yang telah diupload
      final avatar = await storage.ref('$uid/avatar$ext').getDownloadURL();

      return avatar;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _uploadAvatarToStorage(
    String uid,
    String ext,
    File avatarFile,
  ) async {
    try {
      await storage.ref('$uid/avatar$ext').putFile(avatarFile);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
