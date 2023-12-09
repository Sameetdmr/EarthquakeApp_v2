// ignore_for_file: unused_local_variable

import 'package:depremapp/ui/splash/SplashPageViewModel.dart';
import 'package:depremapp/utils/constants/App_Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/CustomLottie.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashPageViewModel splashPageViewModel = Get.put(SplashPageViewModel());
    return SafeArea(
      child: Scaffold(
        body: Center(child: CustomLottie(lottieUrl: App_Constants.LOTTIE_PATH_SPLASH_LOADING)),
      ),
    );
  }
}
