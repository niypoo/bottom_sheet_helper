import 'package:bottom_sheet_helper/views/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';
import 'package:bottom_sheet_helper/views/widgets/draggableButton.widget.dart';

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
      child: Stack(
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
              bottom: 5.sp,
            ),
            width: context.width * 0.97,
            margin: EdgeInsets.only(bottom: context.height * 0.03, top: 30),
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
                      bottom: 5.sp,
                    ),
                    child: child,
                  ),
                ),

                // Footer
                if (footer != null) footer!
              ],
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
    );
  }
}
