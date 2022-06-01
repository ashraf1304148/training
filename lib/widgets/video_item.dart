// import 'dart:math';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/data/controller/main_controller.dart';
import 'package:training/models/video_model.dart';
import 'package:training/pages/test.dart';
import 'package:training/route/route_helper.dart';
import 'package:training/utils/colors.dart';
import 'package:training/utils/dimensions.dart';
import 'package:training/widgets/big_text.dart';
import 'package:training/widgets/small_text.dart';
import 'package:training/widgets/youtube_widget.dart';

class VideoItem extends StatefulWidget {
  final VideoModel item;

  const VideoItem({required this.item, Key? key}) : super(key: key);

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          SizedBox(height: Dimensions.font20),
          Row(
            children: [
              Container(
                width: Dimensions.screenWidth * .25,
                height: Dimensions.screenWidth * .25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height10),
                  // gradient: LinearGradient(
                  // colors: [
                  //   AppColors.gradientFirst.withOpacity(.9),
                  //   AppColors.gradientSecond.withOpacity(.9),
                  // ],
                  // stops: [.4, 3],
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  // ),
                  color: Colors.black54,
                  image: DecorationImage(
                      image: AssetImage(
                        widget.item.thumbnail!,
                      ),
                      fit: BoxFit.cover),
                ),
                child: GestureDetector(
                    onTap: () {
                      Get.find<MainController>().videoId =
                          int.parse(widget.item.id!);
                      print(widget.item.id);
                      Get.toNamed(RouteHelper.getInitial);
                      Get.toNamed(RouteHelper.getVideoInfo);

                      setState(() {});

                      // Get.to(Test(path: item.videoUrl!));
                      // _youtubePlayerController.laod(YoutubePlayer.convertUrlToId(url)!);
                      // Get.to(YoutubeWidget(path: item.videoUrl!,));
                    },
                    child:
                        Icon(Icons.play_circle, size: Dimensions.height10 * 4)),
              ),
              SizedBox(width: Dimensions.height10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: widget.item.title!,
                    fontWeight: FontWeight.bold,
                    size: Dimensions.font20 * .75,
                  ),
                  SizedBox(height: Dimensions.height10 * 1.5),
                  SmallText(text: widget.item.time! + " seconds"),
                ],
              ),
            ],
          ),
          SizedBox(height: Dimensions.font20),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.height10,
                    right: Dimensions.height10,
                    top: Dimensions.height5 * .5,
                    bottom: Dimensions.height5 * .5),
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     AppColors.gradientFirst.withOpacity(.9),
                    //     AppColors.gradientSecond.withOpacity(.9),
                    //   ],
                    //   // stops: [.4, 3],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
                    color: AppColors.circuitsColor,
                    borderRadius: BorderRadius.circular(Dimensions.height10)),
                child: SmallText(text: "15s rest"),
              ),
              Expanded(
                  child: DottedLine(
                dashLength: 3,
                dashGapLength: 2,
                lineThickness: 1,
              ))
            ],
          )
        ],
      ),
    );
  }
}
