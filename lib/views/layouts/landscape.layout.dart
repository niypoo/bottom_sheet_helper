import 'package:bottom_sheet_helper/views/widgets/draggableButton.widget.dart';
import 'package:bottom_sheet_helper/views/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patata_responsive/patata_responsive.dart';

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
        Padding(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp, bottom: 3.w ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: color ?? Get.theme.scaffoldBackgroundColor,
            ),
            padding: EdgeInsets.only(
              top: 12.sp,
              right: 12.sp,
              left: 12.sp,
            ),
            width: 65.w,
            height: 65.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
        ),

        // Draggable Button
        if (draggable!)
          Positioned(
            left: 0,
            bottom: 6.h,
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
        child: VerticalDivider(
          color: Get.theme.cardColor,
          endIndent: 25.sp,
          indent: 25.sp,
        ),
      ),
    );
  }
}
