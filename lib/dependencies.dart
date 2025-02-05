
import 'package:get_it/get_it.dart';
import 'package:insta_clone/auth/data/datasources/auth_remote_datasource.dart';
import 'package:insta_clone/auth/data/repositories/auth_repository_impl.dart';
import 'package:insta_clone/auth/domain/repositories/auth_repository.dart';
import 'package:insta_clone/auth/domain/usecase/login_usecase.dart';
import 'package:insta_clone/auth/domain/usecase/signup_usecase.dart';
import 'package:insta_clone/auth/presentaion/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final servicelocator = GetIt.instance;

Future<void> initDependicies() async {
  servicelocator.registerLazySingleton(
    () => Supabase.instance,
  );


  authInit();
}

void authInit() {
  servicelocator.registerLazySingleton(
    () => SignupUsecase(
      authRepository: servicelocator(),
    ),
  );

  servicelocator.registerLazySingleton(
    () => LoginUsecase(
      authRepository: servicelocator(),
    ),
  );

  servicelocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDatasource: servicelocator(),
    ),
  );

  servicelocator.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(
   
      supabase: servicelocator(),
    ),
  );

  //bloc
  servicelocator.registerFactory<AuthBloc>(
    () => AuthBloc(
      signupUsecase: servicelocator(),
      loginUsecase: servicelocator(),
    ),
  );
}
