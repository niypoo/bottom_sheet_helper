import 'package:app_configuration_service/appInfo.config.dart';
import 'package:bottom_sheet_helper/views/widgets/draggableButton.widget.dart';
import 'package:bottom_sheet_helper/views/widgets/header.widget.dart';
import 'package:flutter/material.dart';
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
            borderRadius: BorderRadius.circular(AppConfigService.to.radius),
            color: color ?? Get.theme.scaffoldBackgroundColor,
          ),
          padding: EdgeInsets.only(
            top: AppConfigService.to.space!.l,
            right: AppConfigService.to.space!.l,
            left: AppConfigService.to.space!.l,
          ),
          width: Get.width * 0.6,
          height: Get.height * 0.6,
          margin: EdgeInsets.only(bottom: (Get.height * 0.06)),
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
            left: Get.width * 0.17,
            top: Get.height * 0.08,
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
        width: context.isTablet
            ? (context.height * 0.06)
            : AppConfigService.to.space!.m,
        height: context.height * 0.7,
        child: VerticalDivider(color: Get.theme.cardColor),
      ),
    );
  }
}
