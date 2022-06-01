// import 'package:flutter/material.dart';
// import 'package:training/utils/dimensions.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YoutubeWidget extends StatefulWidget {
//   final String path;
//   const YoutubeWidget({required this.path, Key? key}) : super(key: key);

//   @override
//   State<YoutubeWidget> createState() => _YoutubeWidgetState();
// }

// class _YoutubeWidgetState extends State<YoutubeWidget> {
//   late YoutubePlayerController _youtubePlayerController;
//   bool isLoop = false, isPlaying = true;
//   @override
//   void initState() {
//     super.initState();

//     //********************** */
//     const url = "https://www.youtube.com/watch?v=GQyWIur03aw";
//     _youtubePlayerController = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(widget.path)!,
//       flags: YoutubePlayerFlags(
//         mute: false,
//         loop: false,
//         autoPlay: true,
//         hideControls: false,
//       ),
//     )..addListener(() {});
//   }

//   @override
//   void deactivate() {
//     // TODO: implement deactivate
//     _youtubePlayerController.pause();
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     _youtubePlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: Dimensions.screenWidth,
//           height: Dimensions.screenHeight * .3,
//           // child: YoutubePlayerBuilder(
//           //   player: YoutubePlayer(controller: _youtubePlayerController),
//           //   builder: (context, controller) {
//           //     return Text("hello");
//           //   },
//           // ),
//         ),
//       ),
//     );
//   }
// }
