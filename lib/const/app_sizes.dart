import 'package:flutter/cupertino.dart';

class AppSizes {
  static late MediaQueryData mediaQueryData;
  static late double screenheight;
  static late double screenwidth;

  void initSizes(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenwidth = mediaQueryData.size.width;
    screenheight = mediaQueryData.size.height;
  }
}
