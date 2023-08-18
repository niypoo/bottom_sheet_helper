import 'package:bottom_sheet_helper/views/layouts/landscape.layout.dart';
import 'package:bottom_sheet_helper/views/layouts/porrait.layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheetHelper {
  static Future<dynamic> show({
    bool rounded = true,
    Widget? child,
    double? height,
    Color? color,
    double? elevation,
    bool isDismissible = true,
    bool draggable = true,
    String? title,
    String? subTitle,
    Widget? footer,
    Color? iconColor,
    IconData? icon,
  }) async {
    return await Get.bottomSheet(
      Get.context!.isLandscape
          ? BottomSheetLandscapeLayout(
              draggable: draggable,
              footer: footer,
              title: title,
              subTitle: subTitle,
              iconColor: iconColor,
              icon: icon,
              color: color,
              height: height,
              child: child,
            )
          : BottomSheetPortraitLayout(
              draggable: draggable,
              footer: footer,
              title: title,
              subTitle: subTitle,
              iconColor: iconColor,
              icon: icon,
              color: color,
              height: height,
              child: child,
            ),
      backgroundColor: Colors.transparent,
      elevation: elevation,
      enableDrag: draggable,
      isDismissible: isDismissible,
      useRootNavigator: true,
      isScrollControlled: true,
      barrierColor: Colors.black12,
    );
  }
}
