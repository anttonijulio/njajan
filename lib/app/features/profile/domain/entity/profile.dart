import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String name;
  final String username;
  final String email;
  final String password;
  final String role;
  final String? avatar;
  final String? gender;
  final String? dateOfBirth;
  final String? phoneNumber;
  final String? address;
  final String createdAt;

  const Profile({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.gender,
    required this.dateOfBirth,
    required this.email,
    this.avatar,
    required this.role,
    this.phoneNumber,
    this.address,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        password,
        email,
        avatar,
        role,
        gender,
        dateOfBirth,
        phoneNumber,
        address,
        createdAt,
      ];
}
