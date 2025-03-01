import 'package:fpdart/fpdart.dart';
import 'package:insta_clone/core/errors/failure.dart';
import 'package:photo_manager/photo_manager.dart';

abstract interface class ImagePickRepo {
  Future<Either<Failure, dynamic>> loadPhoneAlbums(RequestType requestType);
  Future<Either<Failure, dynamic>> loadPhoneAsset(AssetPathEntity selectedAlbums);
}
