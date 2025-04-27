import 'dart:math';
import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
import 'package:get/get.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:unicons/unicons.dart';

class AdvanceConformationSheetHelper {
  static Future<dynamic> show({
    required String title,
    required String subTitle,
    Color? color,
    IconData icon = UniconsLine.question,
  }) async {
    // define controller
    final TextEditingController confirmTextController = TextEditingController();
    final int randomNumber = Random().nextInt(9999);

    return CustomBottomSheetHelper.show(
      title: title,
      subTitle: subTitle,
      icon: icon,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.sp),
              child: TextFieldAdvanceBottomSheet(
                confirmTextController: confirmTextController,
                randomNumber: randomNumber,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FlyElevatedButton.primary(
                title: 'Confirm'.tr,
                onPressed: () {
                  Get.back(
                    result:
                        confirmTextController.text == randomNumber.toString()
                            ? true
                            : false,
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FlyElevatedButton.close(
                title: 'Cancel'.tr,
                onPressed: () => Get.back(result: false),
              ),
            ),
          ],
        ),
      ),
      color: color,
    );
  }
}

class TextFieldAdvanceBottomSheet extends StatelessWidget {
  const TextFieldAdvanceBottomSheet({
    Key? key,
    required this.confirmTextController,
    required this.randomNumber,
  }) : super(key: key);

  final TextEditingController confirmTextController;
  final int randomNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(
          color: Get.theme.cardColor,
        ),
        color: Get.theme.cardColor,
      ),
      child: TextFormField(
        controller: confirmTextController,
        decoration: InputDecoration(
          labelText: 'Type number to confirm'.trParams(
            {
              '_umbr': randomNumber.toString(),
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
