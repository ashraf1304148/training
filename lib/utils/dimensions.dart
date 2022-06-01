import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static bool isSmallScreen = (screenWidth < 800);
  static bool isMeduimScreen = (screenWidth >= 800 && screenWidth <= 1200);
  static final bool isLargeScreen = (screenWidth > 1200);

  // height
  static double height5 = screenHeight / 168.8;

  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.75;
  // width
  static double width5 = screenHeight / 168.8;

  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.75;
  // font
  static double font16 = screenHeight / 52.75;

  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  // icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize26 = screenHeight / 32.46;
}
