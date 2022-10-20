import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors/ColorSchemeLight.dart';

class CustomTextTheme {
  static CustomTextTheme? _instance;

  static CustomTextTheme get instance {
    return _instance ??= CustomTextTheme._init();
  }

  CustomTextTheme._init();

  final TextStyle boldCardLeadingText = TextStyle(
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.normal,
    fontSize: 24.sp,
  );

  final TextStyle boldSubtitleText = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 12.sp,
    color: ColorSchemeLight.instance.blackColor,
  );

  final TextStyle cardTitleText = TextStyle(
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
    color: ColorSchemeLight.instance.blackColor,
  );

  final TextStyle cardSubtitleText = TextStyle(
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontSize: 8.sp,
    color: ColorSchemeLight.instance.blackColor,
  );
}
