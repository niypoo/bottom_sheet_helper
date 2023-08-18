import 'package:app_configuration_service/appInfo.config.dart';
import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:flutter/material.dart';
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
          padding: EdgeInsets.all(AppConfigService.to.space!.m),
          child: Column(
            children: [
              FlyElevatedButton.primary(
                title: yesTitle ?? 'Yes'.tr,
                onPressed: () => Get.back(result: true),
                margin: EdgeInsets.only(bottom: AppConfigService.to.space!.s),
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
