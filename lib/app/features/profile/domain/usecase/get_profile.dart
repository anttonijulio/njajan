import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/profile.dart';
import '../repository/profile_repository.dart';

class GetProfile implements NoParamUsecase<Profile> {
  final ProfileRepository profileRepository;

  GetProfile({required this.profileRepository});

  @override
  Future<Either<Failure, Profile>> execute() async {
    return await profileRepository.getProfile();
  }
}
