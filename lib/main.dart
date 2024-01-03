import 'package:depremapp/utils/initialize/ProjectInitialize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/splash/SplashPage.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey();

Future<void> main() async {
  await ProjectInitialize().make();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (__, _) {
        return GetMaterialApp(
          title: 'Earthquake App',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          home: SplashPage(),
          navigatorKey: mainNavigatorKey,
        );
      },
    );
  }
}
