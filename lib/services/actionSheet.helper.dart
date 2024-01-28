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
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                return ListTile(
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5.sp),
                  onTap: () => Get.back(result: options[i].value),
                  leading: options[i].leading,
                  title: Text(
                    options[i].title,
                    style: Get.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                    maxLines: 2,
                  ),
                  subtitle: Text(
                    options[i].subtitle ?? ' ',
                    style: Get.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 9.sp,
                    ),
                    maxLines: 2,
                  ),
                  trailing:
                      currentValue.toString() == options[i].value.toString()
                          ? Icon(
                              UniconsLine.check,
                              color: Get.theme.primaryColor,
                            )
                          : null,
                );
              },
              separatorBuilder: (c, i) => i == options.length
                  ? const SizedBox.shrink()
                  : Divider(
                      height: 0,
                      indent: 10.sp,
                      endIndent: 10.sp,
                      color: Get.theme.cardColor,
                    ),
              itemCount: options.length,
            ),
      color: color,
      height: height,
    );
  }
}
