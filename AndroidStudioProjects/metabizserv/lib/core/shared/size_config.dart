import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width -
        (mediaQueryData.padding.left + mediaQueryData.padding.right);
    screenHeight = mediaQueryData.size.height -
        (mediaQueryData.padding.top + mediaQueryData.padding.bottom);
  }
}
