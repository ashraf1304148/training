import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:training/data/controller/main_controller.dart';
import 'package:training/models/video_model.dart';
import 'package:training/pages/test.dart';
import 'package:training/route/route_helper.dart';
import 'package:training/utils/colors.dart';
import 'package:training/utils/dimensions.dart';
import 'package:training/widgets/big_text.dart';
import 'package:training/widgets/small_text.dart';
import 'package:training/widgets/video_item.dart';

class VideoInfo extends StatelessWidget {
  VideoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Dimensions.screenWidth,
        height: Dimensions.screenHeight,
        padding: EdgeInsets.only(
          top: Dimensions.screenHeight * .05,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(
            colors: [
              AppColors.gradientFirst.withOpacity(.9),
              AppColors.gradientSecond.withOpacity(.9),
            ],
            // stops: [.4, 3],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          children: [
            (Get.find<MainController>().videoId > 0)
                ? headerWidthVideo
                : headerWidthNoVideo,
            videosWidget,
          ],
        ),
      ),
    );
  }

  Widget get headerWidthNoVideo => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          header,
          SizedBox(height: Dimensions.height20),
          BigText(
            text: "Legs Toning",
            color: Colors.white,
            size: Dimensions.font20 * 1.25,
            fontWeight: FontWeight.bold,
          ),
          BigText(
            // text: "and Glutes Workout",
            text: "info: ${Get.find<MainController>().videos.length}",
            color: Colors.white,
            size: Dimensions.font20 * 1.25,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: Dimensions.height45,
          ),
          // detail
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(icon: Icons.timer_outlined, text: "68 min"),
              iconText(icon: Icons.loop, text: "Resistent band, Kettlebell"),
            ],
          ),
        ],
      );
  Widget get headerWidthVideo => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          SizedBox(height: Dimensions.height20),
          Test(path: "assets/videos/10.mp4"),
        ],
      );

  Widget videosWidget = Expanded(
    child: Container(
      // margin: EdgeInsets.only(top: Dimensions.screenHeight * .34),
      padding: EdgeInsets.all(Dimensions.screenWidth * .05),
      decoration: BoxDecoration(
        color: AppColors.homePageBackground,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.screenHeight * .1),
        ),
      ),
      // body
      child: Column(
        children: [
          Row(
            children: [
              BigText(
                text: "Circuit 1 : Legs Toning",
                // fontWeight: FontWeight.bold,
              ),
              Expanded(child: SizedBox()),
              Icon(Icons.loop, color: AppColors.loopColor),
              SmallText(text: " 3 sets"),
            ],
          ),
          SizedBox(height: Dimensions.height20),
          Expanded(
            child: GetBuilder<MainController>(builder: (controller) {
              print(
                  "total length is: ${controller.videos.length} ---- ${controller.isLoaded}");
              return ListView(
                padding: EdgeInsets.zero,
                children: List.generate(
                  controller.videos.length,
                  (index) => Container(
                    // height: Dimensions.screenWidth * .3,d
                    width: Dimensions.screenWidth * .3,
                    child: VideoItem(
                      item: controller.videos[index],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    ),
  );
  Widget header = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
          onTap: () => Get.toNamed(RouteHelper.getInitial),
          child: Icon(Icons.arrow_back_ios, color: Colors.white)),
      GestureDetector(
        onTap: () =>
            Get.to(Test(path: Get.find<MainController>().videos[0].videoUrl!)),
        child: Icon(
          Icons.info_outline,
          color: Colors.white,
        ),
      )
    ],
  );
  Widget iconText({required IconData icon, required String text}) => Container(
        padding: EdgeInsets.all(Dimensions.height5),
        decoration: BoxDecoration(
          color: AppColors.homePageIcons,
          borderRadius: BorderRadius.circular(
            Dimensions.height10,
          ),
        ),
        child: Row(children: [
          Icon(icon, color: AppColors.homePageContainerTextSmall),
          SmallText(
            text: text,
            color: AppColors.homePageContainerTextSmall,
            size: Dimensions.font16 * 1.1,
          )
        ]),
      );
}
