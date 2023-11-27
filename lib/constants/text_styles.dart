import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppStyle {
  static TextStyle normalTextRegular(
      {double fontSize = 14,
        FontWeight fontWeight = FontWeight.w400,
        Color color = AppColor.black1}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle mediumTextRegular(
      {double fontSize = 16,
        FontWeight fontWeight = FontWeight.w400,
        Color color = AppColor.black1}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle mediumTextMedium(
      {double fontSize = 16,
        FontWeight fontWeight = FontWeight.w600,
        Color color = AppColor.black1}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle smallTextRegular(
      {double fontSize = 12,
        FontWeight fontWeight = FontWeight.w400,
        Color color = AppColor.black1}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }
}