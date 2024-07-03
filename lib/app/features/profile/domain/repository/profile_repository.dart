import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failure.dart';
import '../entity/profile.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();

  Future<Either<Failure, void>> updateProfile({
    required String avatarFilePath,
    required String name,
    required String phoneNumber,
    required String address,
    required String gender,
    required String dateOfBirth,
  });
}
