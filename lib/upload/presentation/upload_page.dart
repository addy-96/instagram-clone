import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/core/common/shared/colors.dart';
import 'package:insta_clone/core/common/shared_fun/txtstyl.dart';
import 'package:insta_clone/upload/presentation/bloc/upload_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  AssetEntity? selectedtEntity;
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetList = [];
  List<AssetEntity> selectedAssetEntity = [];
  File? selecTedImageFile;

  @override
  void initState() {
    if (Platform.isAndroid) {
      context.read<UploadBloc>().add(
            LoadAlbumsRequested(
              requestType: RequestType.common,
            ),
          );
    }

    super.initState();
  }

  void albums() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      builder: (context) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: albumList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                setState(() {
                  selectedAlbum = albumList[index];
                });

                // Trigger event to load assets once an album is selected
                context.read<UploadBloc>().add(
                      LoadAssetsRequested(assetPathEntity: selectedAlbum!),
                    );
                Navigator.pop(context);
              },
              title: Text(
                albumList[index].name == "Recent"
                    ? "Gallery"
                    : albumList[index].name,
              ),
            );
          },
        );
      },
    );
  }

  Widget assetWidget(AssetEntity assetEntity) {
    if (assetEntity.type == AssetType.image) {
      return FutureBuilder<File?>(
        future: assetEntity.file, // Fetch the file for the image
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading image'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No image data available'));
          } else {
            File? file = snapshot.data;
            return file == null
                ? Container() // No file found
                : Image.file(file, fit: BoxFit.cover); // Display the image
          }
        },
      );
    } else if (assetEntity.type == AssetType.video) {
      return Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/video_thumbnail_placeholder.png'),
          ),
          const Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.video_camera_back_sharp,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(); // Handle other asset types if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    log(selecTedImageFile == null
        ? 'nulll'
        : selecTedImageFile!.path.toString());
    if (Platform.isAndroid) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 10,
            forceMaterialTransparency: true,
            scrolledUnderElevation: 10,
            shadowColor: Colors.black,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.clear_thick,
                size: 35,
              ),
            ),
            title: Text(
              'New Post',
              style: txtStyle(
                25,
                Colors.black,
              ).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Next',
                  style: txtStyle(
                    18,
                    themeBlue,
                  ).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          body: BlocConsumer<UploadBloc, UploadState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is UploadPageLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is LoadAlbumsSuccessState) {
                albumList = state.loadAlbumresult;
                selectedAlbum = state.loadAlbumresult[0];
                context
                    .read<UploadBloc>()
                    .add(LoadAssetsRequested(assetPathEntity: selectedAlbum!));
              }

              if (state is LoadAssetsSuccessState) {
                selectedtEntity = state.loadAssetresult[0];
                assetList = state.loadAssetresult;
                // selecTedImageFile = state.loadAssetresult[0].file;

                return Column(
                  children: [
                    Container(
                      height: height * 0.5,
                      color: Colors.amber,
                      child:
                          selectedtEntity == null || selecTedImageFile == null
                              ? const SizedBox.shrink()
                              : Image.file(
                                  selecTedImageFile!,
                                  fit: BoxFit.cover,
                                ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            child: Row(
                              children: [
                                if (selectedAlbum != null)
                                  GestureDetector(
                                    onTap: () {
                                      albums();
                                    },
                                    child: Text(
                                      selectedAlbum!.name == "Recent"
                                          ? "Gallery"
                                          : selectedAlbum!.name,
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_downward,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: assetList.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: assetList.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 1,
                                      crossAxisSpacing: 1,
                                    ),
                                    itemBuilder: (context, index) {
                                      AssetEntity assetEntity =
                                          assetList[index];
                                      return GestureDetector(
                                        onTap: () async {
                                          setState(() {
                                            selectedtEntity = assetEntity;
                                            selecTedImageFile = null;
                                          });

                                          // Wait for the file to load
                                          File? file = await assetEntity.file;
                                          setState(() {
                                            selecTedImageFile =
                                                file; // Update the state with the loaded file
                                          });
                                        },
                                        child: assetWidget(assetEntity),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const Center(
                child: Text('Some Error!'),
              );
            },
          ),
        ),
      );
    } else if (kIsWeb) {
      return const Scaffold(body: Center(child: Text('Upload web')));
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Npyhimig'),
        ),
      );
    }
  }
}
