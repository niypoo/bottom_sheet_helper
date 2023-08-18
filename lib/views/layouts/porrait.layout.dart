import 'package:app_configuration_service/appInfo.config.dart';
import 'package:bottom_sheet_helper/views/widgets/header.widget.dart';
import 'package:flutter/material.dart';
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
              borderRadius: BorderRadius.circular(
                AppConfigService.to.radius,
              ),
              color: color ?? Get.theme.scaffoldBackgroundColor,
            ),
            padding: EdgeInsets.only(
              top: AppConfigService.to.space!.l,
              right: AppConfigService.to.space!.l,
              left: AppConfigService.to.space!.l,
              bottom: AppConfigService.to.space!.s,
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
                      bottom: AppConfigService.to.space!.s,
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
