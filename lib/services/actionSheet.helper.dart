import 'package:bottom_sheet_helper/models/actionSheetOption.model.dart';
import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patata_responsive/patata_responsive.dart';
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
                  dense: true,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5.sp),
                  onTap: () => Get.back(result: options[i].value),
                  leading: options[i].leading,
                  title: Text(
                    options[i].title,
                    style: Get.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                    ),
                    maxLines: 2,
                  ),
                  subtitle: options[i].subtitle != null
                      ? Text(
                          options[i].subtitle ?? ' ',
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 10.sp,
                          ),
                          maxLines: 2,
                        )
                      : null,
                  trailing:
                      currentValue.toString() == options[i].value.toString()
                          ? Icon(
                              UniconsLine.check,
                              color: Get.theme.primaryColor,
                              size: 22.sp,
                            )
                          : null,
                );
              },
              separatorBuilder: (c, i) => i == options.length
                  ? const SizedBox.shrink()
                  : Divider(
                      height: 10.sp,
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
