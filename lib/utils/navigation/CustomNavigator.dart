import 'package:depremapp/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigator {
  static final CustomNavigator _singleton = CustomNavigator._internal();
  CustomNavigator._internal();
  factory CustomNavigator() {
    return _singleton;
  }

  void pushToMain(Widget widget) {
    Get.addKey(mainNavigatorKey);
    Get.to<void>(widget);
  }

  void popFromMain() {
    Get.addKey(mainNavigatorKey);
    Get.back<void>();
  }

  void pushAndRemoveUntil(Widget widget) {
    Get.addKey(mainNavigatorKey);
    Get.offAll<void>(widget);
  }
}
