import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/data/controller/main_controller.dart';

import 'package:training/helper/dependencies.dart' as dep;

import 'route/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (context) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteHelper.getInitial,
        getPages: RouteHelper.reutes,
        // home: ContentPage(),
      );
    });
  }
}
