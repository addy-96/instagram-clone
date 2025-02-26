import 'package:get_it/get_it.dart';
import 'package:insta_clone/auth/data/datasources/auth_remote_datasource.dart';
import 'package:insta_clone/auth/data/repositories/auth_repository_impl.dart';
import 'package:insta_clone/auth/domain/repositories/auth_repository.dart';
import 'package:insta_clone/auth/domain/usecase/login_usecase.dart';
import 'package:insta_clone/auth/domain/usecase/signUp_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependecies() async {
  await authInit();

  //usecases
  serviceLocator.registerFactory(
    () => LoginUsecase(
      authRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => SignupUsecase(
      authRepository: serviceLocator(),
    ),
  );
}

Future<void> authInit() async {
  // supabase, auth_remote_datsource, authrepository
  serviceLocator.registerLazySingleton(
    () => Supabase.instance,
  );

  serviceLocator.registerFactory<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(
      supabase: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDatasource: serviceLocator(),
    ),
  );
}
