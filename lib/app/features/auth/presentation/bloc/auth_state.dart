part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String message;

  const LoginSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginFailure extends AuthState {
  final String message;

  const LoginFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final String message;

  const RegisterSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class RegisterFailure extends AuthState {
  final String message;

  const RegisterFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {
  final String message;

  const LogoutSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class LogoutFailure extends AuthState {
  final String message;

  const LogoutFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class UserAuthenticated extends AuthState {}

class UserUnauthenticated extends AuthState {}
