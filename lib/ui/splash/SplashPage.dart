// ignore_for_file: unused_local_variable

import 'package:depremapp/ui/splash/SplashPageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashPageViewModel splashPageViewModel = Get.put(SplashPageViewModel());
    return Scaffold(
      body: Center(child: Text('Hoşgeldiniz...')),
    );
  }
}
