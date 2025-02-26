import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

abstract interface class ImagePickDatasource {
  Future<File?> selectImage();
}

class ImagePickDatasourceImpl implements ImagePickDatasource {
  ImagePickDatasourceImpl({
    required this.imagePicker,
    required this.webImagePicker,
  });

  final ImagePicker imagePicker;
  final ImagePickerPlugin webImagePicker;
  @override
  Future<File?> selectImage() async {
    if (kIsWeb) {
      final pickedImage =
          await webImagePicker.getImageFromSource(source: ImageSource.gallery);

      if (pickedImage == null) {
        return null;
      }

      return File(pickedImage.path);
    }

    if (Platform.isAndroid) {
      final pickedimage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedimage == null) {
        return null;
      } else {
        return File(pickedimage.path);
      }
    }
    return null;
  }
}
