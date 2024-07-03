import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class RegisterUser implements Usecase<void, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUser({required this.authRepository});

  @override
  Future<Either<Failure, void>> execute({
    required RegisterParams params,
  }) async {
    return await authRepository.register(
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterParams extends Equatable {
  final String username;
  final String email;
  final String password;

  const RegisterParams({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        username,
        email,
        password,
      ];
}
