import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/profile_model.dart';

abstract interface class ProfileRemoteDatasource {
  Future<ProfileModel> getProfile();

  Future<void> updateProfile({
    required String avatar,
    required String name,
    required String phoneNumber,
    required String address,
    required String gender,
    required String dateOfBirth,
  });
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  ProfileRemoteDatasourceImpl({
    required this.auth,
    required this.firestore,
  });

  //* get profile
  @override
  Future<ProfileModel> getProfile() async {
    try {
      final user = auth.currentUser;

      if (user != null) {
        final doc = await firestore.collection('user').doc(user.uid).get();
        final profileData = doc.data();
        return ProfileModel.fromRemote(profileData);
      } else {
        throw Exception('NULL USER');
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  //* update profile
  @override
  Future<void> updateProfile({
    required String avatar,
    required String name,
    required String phoneNumber,
    required String address,
    required String gender,
    required String dateOfBirth,
  }) async {
    try {
      final user = auth.currentUser;

      if (user != null) {
        await firestore.collection('user').doc(user.uid).update({
          'avatar': avatar,
          'name': name,
          'phoneNumber': phoneNumber,
          'address': address,
          'gender': gender,
          'dateOfBirth': dateOfBirth,
        });
      } else {
        throw Exception('NULL USER');
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
