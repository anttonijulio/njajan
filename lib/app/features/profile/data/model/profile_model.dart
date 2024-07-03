import '../../domain/entity/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.id,
    required super.name,
    required super.username,
    required super.password,
    required super.gender,
    required super.email,
    required super.avatar,
    required super.dateOfBirth,
    required super.role,
    required super.phoneNumber,
    required super.address,
    required super.createdAt,
  });

  factory ProfileModel.fromRemote(Map<String, dynamic>? data) {
    return ProfileModel(
      id: data?['uid'] ?? '-',
      name: data?['name'] ?? '-',
      username: data?['username'] ?? '-',
      password: data?['password'] ?? '-',
      email: data?['email'] ?? '-',
      avatar: data?['avatar'] ?? '-',
      role: data?['role'] ?? '-',
      dateOfBirth: data?['dateOfBirth'] ?? '-',
      gender: data?['gender'] ?? '-',
      phoneNumber: data?['phoneNumber'] ?? '-',
      address: data?['address'] ?? '-',
      createdAt: data?['createdAt'] ?? '-',
    );
  }
}
