import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:insta_clone/core/errors/failure.dart';

abstract interface class ImagePickRepo {
  Future<Either<Failure, File?>> pickUploadImage();
}
