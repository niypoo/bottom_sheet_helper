import 'package:bottom_sheet_helper/views/widgets/draggableButton.widget.dart';
import 'package:bottom_sheet_helper/views/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class BottomSheetLandscapeLayout extends StatelessWidget {
  const BottomSheetLandscapeLayout({
    Key? key,
    this.title,
    this.subTitle,
    this.color,
    this.draggable,
    this.footer,
    this.icon,
    this.iconColor,
    this.child,
    this.height,
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
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        // Body Of Sheet
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: color ?? Get.theme.scaffoldBackgroundColor,
          ),
          padding: EdgeInsets.only(
            top: 10.sp,
            right: 10.sp,
            left: 10.sp,
          ),
          width: Get.width * 0.6,
          height: Get.height * 0.6,
          margin: EdgeInsets.only(
            bottom: 15.sp,
            left: 15.sp,
            right: 15.sp,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // HEADER
                      if (subTitle != null || title != null)
                        BottomSheetHeader(title: title, subTitle: subTitle),
                      // Footer
                      if (footer != null) footer!
                    ],
                  ),
                ),
              ),

              // divider
              const BottomSheetDividerLandscapeLayout(),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [child!],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Draggable Button
        if (draggable!)
          Positioned(
            left: 0,
            top: Get.height * 0.06,
            child: DraggableButton(
              icon: icon,
              color: color,
              iconColor: iconColor,
            ),
          ),
      ],
    );
  }
}

class BottomSheetDividerLandscapeLayout extends StatelessWidget {
  const BottomSheetDividerLandscapeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.isTablet ? (context.height * 0.06) : 10.sp,
        height: context.height * 0.7,
        child: VerticalDivider(color: Get.theme.cardColor),
      ),
    );
  }
}
