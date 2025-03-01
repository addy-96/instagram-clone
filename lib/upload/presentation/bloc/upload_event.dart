part of 'upload_bloc.dart';

sealed class UploadEvent {}

final class LoadAlbumsRequested extends UploadEvent {
  LoadAlbumsRequested({
    required this.requestType,
  });

  final RequestType requestType;
}

final class LoadAssetsRequested extends UploadEvent {
  LoadAssetsRequested({
    required this.assetPathEntity,
  });
  final AssetPathEntity assetPathEntity;
}
