import 'package:app_configuration_service/appInfo.config.dart';
import 'package:bottom_sheet_helper/models/actionSheetOption.model.dart';
import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class ActionSheetHelper {
  static Future<dynamic> show({
    required List<ActionSheetOption> options,
    double? height,
    dynamic currentValue,
    String? title,
    String? subTitle,
    Color? color,
    IconData? icon,
  }) async {
    return CustomBottomSheetHelper.show(
      title: title,
      subTitle: subTitle,
      icon: icon,
      child: options.isEmpty
          ? Center(
              child: Text(
                'No Data Here'.tr,
                style: Get.textTheme.bodyLarge,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: AppConfigService.to.space!.m),

                  // BODY
                  ...ListTile.divideTiles(
                    context: Get.context,
                    color: Get.theme.iconTheme.color!.withOpacity(0.1),
                    tiles: options.map(
                      (o) {
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: AppConfigService.to.space!.xs,
                          ),
                          leading: o.leading,
                          title: Text(
                            o.title,
                            style: Get.textTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            o.subtitle ?? ' ',
                            style: Get.textTheme.caption,
                          ),
                          onTap: () => Get.back(result: o.value),
                          trailing:
                              currentValue.toString() == o.value.toString()
                                  ? Icon(
                                      UniconsLine.check,
                                      color: Get.theme.primaryColor,
                                    )
                                  : null,
                        );
                      },
                    ).toList(),
                  ).toList()
                ],
              ),
            ),
      color: color,
      height: height,
    );
  }
}
