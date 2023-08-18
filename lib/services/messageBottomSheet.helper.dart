import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedFlexibleButton.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class MessageBottomSheetHelper {
  static Future<dynamic> show({
    required String title,
    String? subTitle,
    double? height,
    String? body,
    Color? color,
    IconData icon = UniconsLine.exclamation_triangle,
  }) async {
    return CustomBottomSheetHelper.show(
      title: title,
      subTitle: subTitle,
      icon: icon,
      height: height,
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlyElevatedFlexibleButton.close(
            title: 'Close'.tr,
            onPressed: () => Get.back(result: false),
          )
        ],
      ),
      child: body == null
          ? null
          : SingleChildScrollView(
              // padding: const EdgeInsets.symmetric(vertical: Config.sm Margin),
              child: Column(
                children: [Text(body)],
              ),
            ),
      color: color,
    );
  }
}
