import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/pages/test.dart';
import 'package:training/route/route_helper.dart';
import 'package:training/utils/colors.dart';
import 'package:training/utils/dimensions.dart';
import 'package:training/widgets/big_text.dart';
import 'package:training/widgets/small_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        color: AppColors.homePageBackground,
        width: Dimensions.screenWidth * .9,
        child: Column(
          children: [
            SizedBox(height: Dimensions.height30),
            Row(
              children: [
                GestureDetector(
                  // onTap: (() => Get.to(Test())),
                  child: BigText(
                      text: "Training",
                      size: Dimensions.font20 * 1.25,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                Icon(Icons.arrow_back_ios),
                Icon(Icons.calendar_month_outlined),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            SizedBox(height: Dimensions.height30),
            GestureDetector(
              onTap: () => Get.toNamed(RouteHelper.getVideoInfo),
              child: Row(
                children: [
                  BigText(
                    text: "Your program",
                    size: Dimensions.font20 * .8,
                    fontWeight: FontWeight.bold,
                  ),
                  Expanded(child: Container()),
                  BigText(
                    text: "Details",
                    size: Dimensions.font20,
                    color: Colors.blue,
                  ),
                  Icon(Icons.arrow_forward_outlined),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            // next work out
            nextWorkWidget,
            SizedBox(height: Dimensions.height10),
            vectorWidget,
            SizedBox(height: Dimensions.height20),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      areaOfFocus(img: "img", title: "1"),
                      areaOfFocus(img: "img", title: "2"),
                    ],
                  ),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      areaOfFocus(img: "img", title: "3"),
                      areaOfFocus(img: "img", title: "4"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  get nextWorkWidget => Container(
        width: Dimensions.screenWidth * .9,
        height: Dimensions.screenHeight * .26,
        padding: EdgeInsets.all(Dimensions.height20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.gradientFirst.withOpacity(.9),
              AppColors.gradientSecond.withOpacity(.9),
            ],
            // stops: [.4, 3],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.height20),
            bottomLeft: Radius.circular(Dimensions.height20),
            bottomRight: Radius.circular(Dimensions.height20),
            topRight: Radius.circular(Dimensions.height20 * 5),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 10),
              blurRadius: 20,
              // spreadRadius: 3,
              color: AppColors.gradientSecond.withOpacity(.2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // left side
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: "Next workout",
                  color: AppColors.homePageContainerTextBig,
                ),
                BigText(
                    text: "Legs Toning",
                    color: AppColors.homePageContainerTextBig,
                    size: Dimensions.font26 * .9),
                BigText(
                    text: "and Glutes Workout",
                    color: AppColors.homePageContainerTextBig,
                    size: Dimensions.font26 * .9),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    Icon(
                      Icons.timer_sharp,
                      color: AppColors.homePageContainerTextSmall,
                    ),
                    SizedBox(width: Dimensions.height10 * .5),
                    SmallText(
                      text: "60 min",
                      color: AppColors.homePageContainerTextSmall,
                    ),
                    // Expanded(child: Container()),
                  ],
                )
              ],
            ),
            // right side (play button)
            Container(
              width: Dimensions.height10 * 5,
              height: Dimensions.height10 * 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(4, 8),
                      blurRadius: 8,
                      spreadRadius: 8,
                      color: AppColors.gradientFirst.withOpacity(.7))
                ],
              ),
              child: Icon(
                Icons.play_arrow,
                color: AppColors.homePageIcons,
                size: Dimensions.height10 * 4,
              ),
            )
          ],
        ),
      );
  get vectorWidget => Container(
        height: Dimensions.screenHeight * .17,
        width: Dimensions.screenWidth * .9,
        // color: Colors.red,
        child: Stack(children: [
          // widget
          Positioned(
            top: Dimensions.height20,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                right: Dimensions.height20 * 2,
                bottom: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      spreadRadius: 4,
                      blurRadius: 10,
                      color: AppColors.gradientSecond.withOpacity(.7),
                    )
                  ]),
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "You are doning great",
                        color: Colors.blue,
                        size: Dimensions.font20,
                        fontWeight: FontWeight.bold,
                      ),
                      Expanded(child: SizedBox()),
                      SmallText(
                        text: "Keep it up",
                        size: Dimensions.font16,
                      ),
                      SmallText(
                        text: "stick to your plam",
                        size: Dimensions.font16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //vector
          /* Positioned(
            top: 0,
            bottom: Dimensions.height20,
            left: Dimensions.screenWidth * .08,
            right: Dimensions.screenWidth * .5,
            child: Image.asset(
              "assets/img/1.png",
              fit: BoxFit.fill,
            ),
          ),*/
        ]),
      );
  Widget areaOfFocus({required String img, required String title}) {
    return Container(
      width: Dimensions.screenWidth * .41,
      height: Dimensions.screenWidth * .41,
      padding: EdgeInsets.only(
        left: Dimensions.screenWidth * .1,
        right: Dimensions.screenWidth * .1,
        top: Dimensions.screenWidth * .11,
        bottom: Dimensions.height5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              spreadRadius: 1,
              blurRadius: 5,
              color: AppColors.gradientSecond.withOpacity(.7),
            )
          ]),
      child: Column(children: [
        Expanded(
          child: Center(
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
          ),
        ),
        SizedBox(height: Dimensions.height10),
        BigText(text: title),
      ]),
    );
  }
}
