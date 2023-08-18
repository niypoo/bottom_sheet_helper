import 'package:flutter/widgets.dart';

class ActionSheetOption {
  final String title;
  final String? subtitle;
  final dynamic value;
  final Widget? leading;

  ActionSheetOption({
    required this.title,
    required this.value,
    this.subtitle,
    this.leading,
  });
}
