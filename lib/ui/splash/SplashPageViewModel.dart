import 'package:flutter/material.dart';
import '../../utils/navigation/CustomNavigator.dart';
import '../ViewModelBase.dart';
import '../home/HomePage.dart';

class SplashPageViewModel extends ViewModelBase {
  SplashPageViewModel() {
    initPage();
  }

  initPage() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await isStart();
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  isStart() async {
    CustomNavigator().pushAndRemoveUntil(HomePage());
  }
}
