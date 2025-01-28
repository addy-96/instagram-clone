import 'package:fpdart/fpdart.dart';
import 'package:insta_clone/auth/domain/repositories/auth_repository.dart';
import 'package:insta_clone/core/errors/failure.dart';
import 'package:insta_clone/core/usecase/usecase_interface.dart';

class SignupUsecase implements UsecaseInterface<String, UserSignUpParams> {
  final AuthRepository authRepository;

  SignupUsecase({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(UserSignUpParams param) async {
    return await authRepository.signUserUp(
      param.username,
      param.email,
      param.password,
    );
  }
}

class UserSignUpParams {
  final String username;
  final String email;
  final String password;

  UserSignUpParams({
    required this.email,
    required this.username,
    required this.password,
  });
}
