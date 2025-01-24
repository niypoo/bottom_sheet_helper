import 'package:bottom_sheet_helper/views/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_sheet_helper/views/widgets/draggableButton.widget.dart';
import 'package:patata_responsive/patata_responsive.dart';

class BottomSheetPortraitLayout extends StatelessWidget {
  const BottomSheetPortraitLayout({
    Key? key,
    this.title,
    this.subTitle,
    this.color,
    this.draggable,
    this.footer,
    this.icon,
    this.iconColor,
    this.height,
    this.child,
  }) : super(key: key);

  final String? subTitle;
  final String? title;
  final Color? color;
  final Color? iconColor;
  final dynamic icon;
  final Widget? footer;
  final Widget? child;
  final bool? draggable;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 0.05.h),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            // Body Of Sheet
            Padding(
              padding: EdgeInsets.only(top: 20.sp),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: color ?? Get.theme.scaffoldBackgroundColor,
                ),
                padding: EdgeInsets.only(
                  top: 10.sp,
                  right: 12.sp,
                  left: 12.sp,
                  bottom: 10.sp,
                ),
                width: context.width * 0.95,
                height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // HEADER
                    if (subTitle != null || title != null)
                      BottomSheetHeader(title: title, subTitle: subTitle),
        
                    // body
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 15.sp,
                        ),
                        child: child,
                      ),
                    ),
        
                    // Footer
                    if (footer != null) footer!
                  ],
                ),
              ),
            ),
        
            // Draggable Button
            if (draggable!)
              DraggableButton(
                icon: icon,
                color: color,
                iconColor: iconColor,
              ),
          ],
        ),
      ),
    );
  }
}
