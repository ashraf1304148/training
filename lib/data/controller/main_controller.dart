import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:training/data/repo/main_repo.dart';
import 'package:training/models/video_model.dart';
import 'package:video_player/video_player.dart';

class MainController extends GetxController {
  final MainRepo mainRepo;
  List<VideoModel> videos = [];
  bool isLoaded = false;
  int videoId = 0;
  VideoPlayerController? videoPlayerController;
  MainController({required this.mainRepo}) {
    load();
    update();
    // playNetworkVideo(path: videos[0].videoUrl!);
  }
  // void get loading async {
  //   await rootBundle.loadString("json/video_info.json").then((s) {
  //     videos =
  //         (json.decode(s) as List).map((e) => VideoModel.fromJson(e)).toList();
  //     isLoaded = true;
  //   });
  // }
  load() {
    rootBundle.loadString("json/videoinfo2.json").then((s) {
      // info = jsonDecode(s) as List;
      videos =
          (json.decode(s) as List).map((e) => VideoModel.fromJson(e)).toList();
    });

    isLoaded = true;
  }

  void playAssetVideo({required String path}) {
    videoPlayerController = VideoPlayerController.asset(path)
      ..addListener(() {
        update();
      })
      ..setLooping(false)
      ..initialize().then((_) => videoPlayerController!.play());
    print("is good");
  }

  void playNetworkVideo({required String path}) {
    videoPlayerController = VideoPlayerController.network(path)
      ..addListener(() {
        update();
      })
      ..setLooping(false)
      ..initialize().then((_) => videoPlayerController!.play());
    print("is good");
  }
  // List<VideoModel> get videos => _videos;

}
