import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:unicons/unicons.dart';

class DraggableButton extends StatelessWidget {
  const DraggableButton({
    Key? key,
    this.icon,
    this.color,
    this.iconColor,
  }) : super(key: key);

  final IconData? icon;
  final Color? color;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22.sp),
      onTap: Get.back,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? Get.theme.scaffoldBackgroundColor,
        ),
        height: 40.sp,
        width: 40.sp,
        child: Icon(
          icon ?? UniconsLine.angle_down,
          color: iconColor ?? Get.theme.iconTheme.color,
          size: 28.sp,
        ),
      ),
    );
  }
}
