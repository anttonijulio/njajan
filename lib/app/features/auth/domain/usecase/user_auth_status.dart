import '../repository/auth_repository.dart';

class UserAuthStatus {
  final AuthRepository authRepository;

  UserAuthStatus({required this.authRepository});

  bool execute() {
    return authRepository.userAuthStatus();
  }
}
