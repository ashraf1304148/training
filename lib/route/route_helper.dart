import 'package:get/route_manager.dart';
import 'package:training/pages/home_page.dart';
import 'package:training/pages/video_info.dart';

class RouteHelper {
  static const String _initial = "/";
  static const String _videoInfo = "/video-info";

  static String get getInitial => _initial;
  static String get getVideoInfo => _videoInfo;

  static List<GetPage> reutes = [
    // initial
    GetPage(
      name: _initial,
      page: () {
        return HomePage();
      },
    ),
    // initial
    GetPage(
      name: _videoInfo,
      page: () {
        return VideoInfo();
      },
    ),
  ];
}
