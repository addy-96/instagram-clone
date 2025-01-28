import 'package:fpdart/fpdart.dart';
import 'package:insta_clone/auth/data/datasources/auth_remote_datasource.dart';
import 'package:insta_clone/auth/domain/repositories/auth_repository.dart';
import 'package:insta_clone/core/errors/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDatasource,
  });
  final AuthRemoteDatasource authRemoteDatasource;
  @override
  Future<Either<Failure, String>> signUserUp(
    String username,
    String email,
    String password,
  ) async {
    try {
      final res = await authRemoteDatasource.signUserUp(
        username: username,
        email: email,
        password: password,
      );
      return right(res);
    } catch (err) {
      return left(
        Failure(
          message: err.toString(),
        ),
      );
    }
  }
}
