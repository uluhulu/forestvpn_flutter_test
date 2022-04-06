import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static const _sfProDisplay = TextStyle(fontFamily: 'SF Pro Display');

  static TextStyle headline1White28 = _sfProDisplay.copyWith(
    fontSize: 28.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headline2Black20 = _sfProDisplay.copyWith(
    fontSize: 20.sp,
    color: Colors.black,
  );
  static TextStyle headline3Black18 = _sfProDisplay.copyWith(
    fontSize: 18.sp,
    color: Colors.black,
  );
  static TextStyle  bodyText1Black16 = _sfProDisplay.copyWith(
    fontSize: 16.sp,
    color: Colors.black,
  );
  static TextStyle  bodyText2Grey12 = _sfProDisplay.copyWith(
    fontSize: 12.sp,
    color: Colors.grey,
  );


}