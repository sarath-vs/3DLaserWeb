import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double customWidth(num value) {
  return ScreenUtil().setWidth(value).toDouble();
}

double customHeight(num value) {
  return ScreenUtil().setHeight(value).toDouble();
}

double customFontSize(num value) {
  return ScreenUtil().setSp(value).toDouble();
}

Widget customVerticalGap(double value) {
  return SizedBox(height: customHeight(value));
}

Widget customHorizontalGap(num value) {
  return SizedBox(width: customWidth(value));
}
