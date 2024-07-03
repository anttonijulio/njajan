part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class GetProfileLoading extends ProfileState {}

class GetProfileLoaded extends ProfileState {
  final Profile profile;

  const GetProfileLoaded({required this.profile});

  @override
  List<Object> get props => [profile];
}

class GetProfileFailure extends ProfileState {
  final String message;

  const GetProfileFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {
  final String message;

  const UpdateProfileSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class UpdateProfileFailure extends ProfileState {
  final String message;

  const UpdateProfileFailure({required this.message});

  @override
  List<Object> get props => [message];
}
