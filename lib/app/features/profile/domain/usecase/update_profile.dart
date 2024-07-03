import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/profile_repository.dart';

class UpdateProfile implements Usecase<void, UpdateProfileParams> {
  final ProfileRepository profileRepository;

  UpdateProfile({required this.profileRepository});

  @override
  Future<Either<Failure, void>> execute({
    required UpdateProfileParams params,
  }) async {
    return await profileRepository.updateProfile(
      avatarFilePath: params.avatarFilePath,
      name: params.name,
      phoneNumber: params.phoneNumber,
      address: params.address,
      gender: params.gender,
      dateOfBirth: params.dateOfBirth,
    );
  }
}

class UpdateProfileParams {
  final String avatarFilePath;
  final String name;
  final String phoneNumber;
  final String address;
  final String gender;
  final String dateOfBirth;

  UpdateProfileParams({
    required this.avatarFilePath,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.dateOfBirth,
  });
}
