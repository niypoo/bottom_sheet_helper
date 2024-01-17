// import 'package:app_configuration_service/appInfo.config.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ClearButton extends StatelessWidget {
//   const ClearButton({
//     Key key,
//     @required this.text,
//     @required this.onPressed,
//   }) : super(key: key);

//   final String text;
//   final Function onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: TextButton.styleFrom(
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.sp),
//         ),
//         padding: EdgeInsets.symmetric(
//           vertical: AppConfigService.to.space.s,
//         ),
//       ),
//       onPressed: onPressed,
//       child: Text(
//         text,
//         style: Get.textTheme.bodyLarge,
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }
