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
