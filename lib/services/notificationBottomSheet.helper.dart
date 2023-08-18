import 'package:app_configuration_service/appInfo.config.dart';
import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class NotificationBottomHelper {
  // show notification dialog
  static Future<dynamic> show({
    required String title,
    required String subTitle,
    Color? bgColor,
    Color? textColor,
    IconData icon = UniconsLine.question,
    String? primaryButton,
  }) async {
    return CustomBottomSheetHelper.show(
      title: title,
      subTitle: subTitle,
      icon: icon,
      iconColor: textColor,
      child: Padding(
        padding: EdgeInsets.all(AppConfigService.to.space!.m),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Take
            // if (primaryButton != null)
            FlyElevatedButton.primary(
              onPressed: () => Get.back(result: true),
              title: primaryButton ?? 'Take'.tr,
            ),

            FlyElevatedButton.close(
              onPressed: () => Get.back(result: 'PUT_OFF'),
              title: 'Put-off'.tr,
            ),

            FlyElevatedButton.close(
              onPressed: () => Get.back(result: false),
              title: 'Cancel'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
