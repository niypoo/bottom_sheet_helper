import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    Key? key,
    this.title,
    this.subTitle,
  }) : super(key: key);

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Text(
            title!,
            style: Get.textTheme.titleMedium,
            textAlign: TextAlign.start,
          ),
        if (subTitle != null)
          Text(
            subTitle!,
            style: Get.textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
      ],
    );
  }
}
