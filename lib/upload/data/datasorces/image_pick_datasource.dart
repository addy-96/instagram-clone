import 'dart:io';

import 'package:photo_manager/photo_manager.dart';

abstract interface class ImagePickDatasource {
  Future<File?> getWebImage();
  Future loadPhoneAlbums(RequestType requestType);
  Future loadPhoneAssets(AssetPathEntity selectedAlbums);
}

class ImagePickDatatsourceImpl implements ImagePickDatasource {
  const ImagePickDatatsourceImpl();

  @override
  Future loadPhoneAlbums(RequestType requestType) async {
    var permission = await PhotoManager.requestPermissionExtend();

    List<AssetPathEntity> albumList = [];

    if (permission.isAuth) {
      albumList = await PhotoManager.getAssetPathList(
        type: requestType,
      );
    } else {
      PhotoManager.openSetting();
    }
    return albumList;
  }

  @override
  Future loadPhoneAssets(AssetPathEntity selectedAlbums) async {
    List<AssetEntity> assetsList = await selectedAlbums.getAssetListRange(
        start: 0, end: await selectedAlbums.assetCountAsync);

    return assetsList;
  }

  @override
  Future<File?> getWebImage() {
    // TODO: implement getWebImage
    throw UnimplementedError();
  }
}
