import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/profile.dart';
import '../../domain/usecase/get_profile.dart';
import '../../domain/usecase/update_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile getProfile;
  final UpdateProfile updateProfile;

  ProfileBloc({
    required this.getProfile,
    required this.updateProfile,
  }) : super(ProfileInitial()) {
    on<GetProfileEvent>(_getProfileEvent);
    on<UpdateProfileEvent>(_updateProfileEvent);
  }

  void _getProfileEvent(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(GetProfileLoading());

    final response = await getProfile.execute();

    response.fold(
      (l) => emit(GetProfileFailure(message: l.message)),
      (r) => emit(GetProfileLoaded(profile: r)),
    );
  }

  void _updateProfileEvent(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(UpdateProfileLoading());

    final response = await updateProfile.execute(
      params: UpdateProfileParams(
        avatarFilePath: event.avatarFilePath,
        name: event.name,
        phoneNumber: event.phoneNumber,
        address: event.address,
        gender: event.gender,
        dateOfBirth: event.dateOfBirth,
      ),
    );

    response.fold(
      (l) => emit(UpdateProfileFailure(message: l.message)),
      (r) => emit(
        const UpdateProfileSuccess(message: 'Berhasil mengupdate biodata'),
      ),
    );
  }
}
