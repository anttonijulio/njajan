import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class LogoutUser implements NoParamUsecase<void> {
  final AuthRepository authRepository;

  LogoutUser({required this.authRepository});

  @override
  Future<Either<Failure, void>> execute() async {
    return await authRepository.logout();
  }
}
