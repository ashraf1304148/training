import 'package:flutter/material.dart';

import 'package:training/utils/dimensions.dart';
import 'package:video_player/video_player.dart';

class Test extends StatefulWidget {
  String path;
  Test({required this.path, Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  VideoPlayerController? videoController;

  bool isLoop = false, isPlaying = true, isSpeed = false, isSlow = false;
  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.asset(
        // "http://techslides.com/demos/sample-videos/small.mp4")
        // "   https://www.kapwing.com/videos/6293afcb691e53006c4e52aa")
        widget.path)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(false)
      ..initialize().then((value) {
        videoController!.play();
        setState(() {});
      });

    //********************** */
  }

  @override
  void deactivate() {
    // TODO: implement deactivate

    super.deactivate();
  }

  @override
  void dispose() {
    videoController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth * 1,
      height: Dimensions.screenHeight * .4,
      child: Column(
        children: [
          // video
          Container(
            width: Dimensions.screenWidth * 1,
            height: Dimensions.screenHeight * .33,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  top: 0,
                  right: 0,
                  child: VideoPlayer(videoController!),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 20,
                    child: VideoProgressIndicator(videoController!,
                        allowScrubbing: true))
              ],
            ),
          ),
          // buttons
          buttons,
        ],
      ),
    );
  }

  get buttons {
    double iconSize = Dimensions.height10 * 3.5;
    Color iconColor = Colors.white, iconActiveColor = Colors.blue;

    return Container(
      width: Dimensions.screenWidth * .7,
      padding: EdgeInsets.all(Dimensions.height5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => setState(() {
              isLoop = !isLoop;
              videoController!.setLooping(isLoop);
            }),
            child: Icon(
              Icons.loop,
              size: iconSize,
              color: isLoop ? iconActiveColor : iconColor,
            ),
          ),
          // slow play
          GestureDetector(
            onTap: () => setState(() {
              isSpeed = false;
              isSlow = !isSlow;
              videoController!.setPlaybackSpeed(isSlow ? 0.75 : 1);
            }),
            child: Icon(
              Icons.keyboard_double_arrow_left_outlined,
              size: iconSize,
              color: isSlow ? iconActiveColor : iconColor,
            ),
          ),
          //play or pase
          GestureDetector(
            onTap: () => setState(() {
              isPlaying = !isPlaying;

              (isPlaying) ? videoController!.play() : videoController!.pause();
            }),
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: iconSize,
              color: !isPlaying ? iconActiveColor : iconColor,
            ),
          ),
          // fast play
          GestureDetector(
            onTap: () => setState(() {
              isSlow = false;
              isSpeed = !isSpeed;
              videoController!.setPlaybackSpeed(isSpeed ? 1.5 : 1);
            }),
            child: Icon(
              Icons.keyboard_double_arrow_right_outlined,
              size: iconSize,
              color: isSpeed ? iconActiveColor : iconColor,
            ),
          ),
          // stop
          GestureDetector(
            onTap: () => setState(() {
              videoController!
                ..seekTo(Duration(seconds: 0))
                ..pause()
                ..setPlaybackSpeed(1);
              isPlaying = isLoop = isSpeed = isSlow = false;
            }),
            child: Icon(
              Icons.stop,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
