import 'package:depremapp/ui/splash/SplashPage.dart';
import 'package:depremapp/utils/navigation/CustomNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomGenericDialogWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String message;

  CustomGenericDialogWidget(this.iconData, this.title, this.message);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: context.textTheme.titleLarge,
      ),
      content: Text(
        message,
        style: context.textTheme.titleSmall,
      ),
      icon: Icon(
        iconData,
        color: Colors.blue,
        size: 40.h,
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              CustomNavigator().pushAndRemoveUntil(SplashPage());
            },
            child: Text('Tekrar Dene')),
      ],
    );
  }
}
