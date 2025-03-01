import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/upload/domain/usecase/load_albums_usecase.dart';
import 'package:insta_clone/upload/domain/usecase/load_asset_usecase.dart';
import 'package:photo_manager/photo_manager.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final LoadAlbumsUsecase loadAlbumsUsecase;
  final LoadAssetUsecase loadAssetUsecase;
  UploadBloc({
    required this.loadAlbumsUsecase,
    required this.loadAssetUsecase,
  }) : super(UploadInitialState()) {
    //
    on<LoadAlbumsRequested>(onLoadAlbumsRequested);

    //
    on<LoadAssetsRequested>(onLoadAssetsRequested);
  }

  void onLoadAlbumsRequested(
      LoadAlbumsRequested event, Emitter<UploadState> emit) async {
    emit(UploadPageLoadingState());

    final res = await loadAlbumsUsecase.call(
      LoadAlbumsParams(
        requestType: event.requestType,
      ),
    );
    res.fold(
      (l) => emit(LoadAlbumsOrAssetsFailureState(errorMessage: l.message)),
      (r) => emit(LoadAlbumsSuccessState(loadAlbumresult: r)),
    );
  }

  void onLoadAssetsRequested(
      LoadAssetsRequested event, Emitter<UploadState> emit) async {
    final res = await loadAssetUsecase.call(
      LoadAssestParams(
        assetPathEntity: event.assetPathEntity,
      ),
    );

    res.fold(
      (l) => emit(LoadAlbumsOrAssetsFailureState(errorMessage: l.message)),
      (r) => emit(LoadAssetsSuccessState(loadAssetresult: r)),
    );
  }
}
