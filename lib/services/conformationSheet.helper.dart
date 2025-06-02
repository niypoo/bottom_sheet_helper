import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class ConformationSheetHelper {
  static Future<dynamic> show({
    required String title,
    required String subTitle,
    Color? color,
    IconData? icon = UniconsLine.question,
    String? yesTitle,
    String? noTitle,
  }) async {
    return CustomBottomSheetHelper.show(
      title: title,
      subTitle: subTitle,
      icon: icon,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Wrap(
            spacing: 5.sp,
            children: [
              FlyElevatedButton.primary(
                title: yesTitle ?? 'Yes'.tr,
                onPressed: () => Get.back(result: true),
              ),
              FlyElevatedButton.close(
                title: noTitle ?? 'No'.tr,
                onPressed: () => Get.back(result: false),
              ),
            ],
          ),
        ),
      ),
      color: color,
    );
  }
}
