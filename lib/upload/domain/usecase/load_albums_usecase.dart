import 'package:fpdart/fpdart.dart';
import 'package:insta_clone/core/errors/failure.dart';
import 'package:insta_clone/core/usecase/usecase_interface.dart';
import 'package:insta_clone/upload/domain/repositories/image_pick_repo.dart';
import 'package:photo_manager/photo_manager.dart';

class LoadAlbumsUsecase implements UsecaseInterface<dynamic, LoadAlbumsParams> {
  LoadAlbumsUsecase({
    required this.imagePickRepo,
  });

  final ImagePickRepo imagePickRepo;

  @override
  Future<Either<Failure, dynamic>> call(param) async {
    return await imagePickRepo.loadPhoneAlbums(
      param.requestType,
    );
  }
}

class LoadAlbumsParams {
  LoadAlbumsParams({
    required this.requestType,
  });
  final RequestType requestType;
}
