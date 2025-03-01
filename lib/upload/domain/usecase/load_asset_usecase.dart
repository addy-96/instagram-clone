
import 'package:fpdart/fpdart.dart';
import 'package:insta_clone/core/errors/failure.dart';
import 'package:insta_clone/core/usecase/usecase_interface.dart';
import 'package:insta_clone/upload/domain/repositories/image_pick_repo.dart';
import 'package:photo_manager/photo_manager.dart';

class LoadAssetUsecase
    implements UsecaseInterface<dynamic, LoadAssestParams> {
  ImagePickRepo imagePickRepo;

  LoadAssetUsecase({
    required this.imagePickRepo,
  });

  @override
  Future<Either<Failure, dynamic>> call(LoadAssestParams param) async {
    return await imagePickRepo.loadPhoneAsset(param.assetPathEntity);
  }
}

class LoadAssestParams {
  LoadAssestParams({
    required this.assetPathEntity,
  });
  AssetPathEntity assetPathEntity;
}
