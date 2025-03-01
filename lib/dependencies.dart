import 'package:get_it/get_it.dart';
import 'package:insta_clone/auth/data/datasources/auth_remote_datasource.dart';
import 'package:insta_clone/auth/data/repositories/auth_repository_impl.dart';
import 'package:insta_clone/auth/domain/repositories/auth_repository.dart';
import 'package:insta_clone/auth/domain/usecase/login_usecase.dart';
import 'package:insta_clone/auth/domain/usecase/signUp_usecase.dart';
import 'package:insta_clone/upload/data/datasorces/image_pick_datasource.dart';
import 'package:insta_clone/upload/data/repositories/image_pick_repo_impl.dart';
import 'package:insta_clone/upload/domain/repositories/image_pick_repo.dart';
import 'package:insta_clone/upload/domain/usecase/load_albums_usecase.dart';
import 'package:insta_clone/upload/domain/usecase/load_asset_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependecies() async {
  await authInit();
  await uploadImageInit();

  //usecases - auth
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

  //usecase - upload
  serviceLocator.registerFactory(
    () => LoadAlbumsUsecase(
      imagePickRepo: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => LoadAssetUsecase(
      imagePickRepo: serviceLocator(),
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

Future<void> uploadImageInit() async {
  serviceLocator.registerFactory<ImagePickDatasource>(
    () => const ImagePickDatatsourceImpl(),
  );

  serviceLocator.registerFactory<ImagePickRepo>(
    () => ImagePickRepoImpl(
      imagePickDatasource: serviceLocator(),
    ),
  );
}
