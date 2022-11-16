import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:you_cook/core/styles/color.dart';

class ConfigLoadingToast {
  static void configLoading() {
    EasyLoading.instance
          ..displayDuration = const Duration(milliseconds: 2000)
          ..indicatorType = EasyLoadingIndicatorType.fadingCircle
          ..loadingStyle = EasyLoadingStyle.custom
          ..indicatorSize = 45.0
          ..radius = 10.0
          ..progressColor = whiteColor
          ..backgroundColor = redColor
          ..indicatorColor = Colors.white
          ..textColor = whiteColor
          ..maskColor = Colors.transparent
          ..userInteractions = true
          ..dismissOnTap = false
        // ..customAnimation = CustomAnimation()
        ;
  }
}
