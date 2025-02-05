part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class UserSignUpRequestedEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;

  UserSignUpRequestedEvent({
    required this.username,
    required this.email,
    required this.password,
  });
}

final class UserLogInRequestedEvent extends AuthEvent {
  final String email;
  final String password;

  UserLogInRequestedEvent({
    required this.email,
    required this.password,
  });
}
