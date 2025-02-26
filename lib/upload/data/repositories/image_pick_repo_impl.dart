import 'dart:io';

import 'package:fpdart/src/either.dart';
import 'package:insta_clone/core/errors/failure.dart';
import 'package:insta_clone/upload/data/datasorces/image_pick_datasource.dart';
import 'package:insta_clone/upload/domain/repositories/image_pick_repo.dart';

class ImagePickRepoImpl implements ImagePickRepo {
  ImagePickRepoImpl({required this.imagePickDatasource});

  final ImagePickDatasource imagePickDatasource;
  @override
  Future<Either<Failure, File?>> pickUploadImage() async {
    try {
      final res = await imagePickDatasource.selectImage();
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
