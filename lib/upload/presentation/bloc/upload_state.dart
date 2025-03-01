part of 'upload_bloc.dart';

sealed class UploadState {}

final class UploadInitialState extends UploadState {}

final class UploadPageLoadingState extends UploadState {}

final class LoadAlbumsSuccessState extends UploadState {
  LoadAlbumsSuccessState({
    required this.loadAlbumresult,
  });
  final dynamic loadAlbumresult;
}

final class LoadAssetsSuccessState extends UploadState {
  LoadAssetsSuccessState({
    required this.loadAssetresult,
  });
  final dynamic loadAssetresult;
}

final class LoadAlbumsOrAssetsFailureState extends UploadState {
  LoadAlbumsOrAssetsFailureState({
    required this.errorMessage,
  });
  final String errorMessage;
}
