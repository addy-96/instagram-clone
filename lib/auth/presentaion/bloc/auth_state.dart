part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthSuccess extends AuthState {
  AuthSuccess({required this.userID});

  final String userID;
}

final class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}

final class AuthLoading extends AuthState {}
