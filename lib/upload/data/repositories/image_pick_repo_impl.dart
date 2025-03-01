import 'package:fpdart/fpdart.dart';
import 'package:insta_clone/core/errors/failure.dart';
import 'package:insta_clone/upload/data/datasorces/image_pick_datasource.dart';
import 'package:insta_clone/upload/domain/repositories/image_pick_repo.dart';
import 'package:photo_manager/photo_manager.dart';

class ImagePickRepoImpl implements ImagePickRepo {
  ImagePickRepoImpl({
    required this.imagePickDatasource,
  });

  final ImagePickDatasource imagePickDatasource;

  @override
  Future<Either<Failure, dynamic>> loadPhoneAlbums(
      RequestType requestType) async {
    try {
      final res = await imagePickDatasource.loadPhoneAlbums(requestType);
      return right(res);
    } catch (err) {
      return left(
        Failure(
          message: err.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> loadPhoneAsset(
      AssetPathEntity selectedAlbums) async {
    try {
      final res = await imagePickDatasource.loadPhoneAssets(selectedAlbums);
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
