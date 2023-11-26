import 'package:bottom_sheet_helper/models/actionSheetOption.model.dart';
import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
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
                  children: ListTile.divideTiles(
                    context: Get.context,
                    color: Get.theme.iconTheme.color!.withOpacity(0.1),
                    tiles: options.map(
                      (option) {
                        return ListTile(
                          horizontalTitleGap: 10.0,
                          minLeadingWidth: 10.0,
                          contentPadding: const EdgeInsets.all(0),
                          leading: option.leading,
                          title: Text(
                            option.title,
                            style: Get.textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                            ),
                            maxLines: 1,
                          ),
                          subtitle: Text(
                            option.subtitle ?? ' ',
                            style: Get.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 10.sp,
                            ),
                            maxLines: 2,
                          ),
                          onTap: () => Get.back(result: option.value),
                          trailing:
                              currentValue.toString() == option.value.toString()
                                  ? Icon(
                                      UniconsLine.check,
                                      color: Get.theme.primaryColor,
                                    )
                                  : null,
                        );
                      },
                    ).toList(),
                  ).toList()),
            ),
      color: color,
      height: height,
    );
  }
}
