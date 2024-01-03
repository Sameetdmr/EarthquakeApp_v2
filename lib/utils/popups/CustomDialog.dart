import 'package:depremapp/ui/components/CustomGenericDialogWidget.dart';
import 'package:depremapp/utils/popups/CustomDialogType.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static Future<void> showGenericDialog(CustomDialogType dialogType, String? titleKey, String messageKey, bool dismissible) async {
    await Future<void>.delayed(Duration(milliseconds: 50));

    switch (dialogType) {
      case CustomDialogType.SUCCESS:
        return;
      case CustomDialogType.INFO:
        return;
      case CustomDialogType.ERROR:
        Get.dialog<void>(CustomGenericDialogWidget(Icons.report_problem_outlined, 'Hata', messageKey), barrierDismissible: dismissible);
        return;
    }
  }

  static void dismiss() {
    if (Get.isDialogOpen!) {
      Get.back<void>(result: true);
      //MSNavigator().popFromMain();
    }
  }
}
