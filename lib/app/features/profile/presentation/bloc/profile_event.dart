part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String avatarFilePath;
  final String name;
  final String phoneNumber;
  final String address;
  final String gender;
  final String dateOfBirth;

  const UpdateProfileEvent({
    required this.avatarFilePath,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.dateOfBirth,
  });

  @override
  List<Object> get props => [
        avatarFilePath,
        name,
        phoneNumber,
        address,
        gender,
        dateOfBirth,
      ];
}
