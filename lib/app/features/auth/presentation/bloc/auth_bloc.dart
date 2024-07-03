import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/strings/app_string.dart';
import '../../domain/usecase/login_user.dart';
import '../../domain/usecase/logout_user.dart';
import '../../domain/usecase/register_user.dart';
import '../../domain/usecase/user_auth_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;
  final LogoutUser logoutUser;
  final UserAuthStatus userAuthStatus;

  AuthBloc({
    required this.loginUser,
    required this.registerUser,
    required this.logoutUser,
    required this.userAuthStatus,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_loginEvent);
    on<RegisterEvent>(_registerEvent);
    on<LogoutEvent>(_logoutEvent);
    on<UserAuthStatusEvent>(_userAuthStatusEvent);
  }

  //* login
  void _loginEvent(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoading());

    final response = await loginUser.execute(
      params: LoginParams(email: event.email, password: event.password),
    );

    response.fold(
      (l) => emit(LoginFailure(message: l.message)),
      (r) => emit(LoginSuccess(
        message: AppString.loginSuccess(r.user?.displayName ?? '-'),
      )),
    );
  }

  //* register
  void _registerEvent(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(RegisterLoading());

    final response = await registerUser.execute(
      params: RegisterParams(
        username: event.username,
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (l) => emit(RegisterFailure(message: l.message)),
      (r) => emit(
        RegisterSuccess(message: AppString.registerSuccess(event.email)),
      ),
    );
  }

  //* logout
  void _logoutEvent(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LogoutLoading());

    final response = await logoutUser.execute();

    response.fold(
      (l) => emit(LogoutFailure(message: l.message)),
      (r) => emit(
        const LogoutSuccess(message: AppString.logoutSuccess),
      ),
    );
  }

  //* UserAuthStatus
  void _userAuthStatusEvent(
    UserAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 4), () {
      final userAuthenticated = userAuthStatus.execute();

      if (userAuthenticated) {
        emit(UserAuthenticated());
      } else {
        emit(UserUnauthenticated());
      }
    });
  }
}
