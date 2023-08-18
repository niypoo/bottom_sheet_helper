// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PrimaryButton extends StatelessWidget {
//   const PrimaryButton({
//     Key key,
//     @required this.text,
//     @required this.onPressed,
//     this.color,
//   }) : super(key: key);

//   final Color color;
//   final String text;
//   final Function onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color ?? Get.theme.primaryColor,
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(
//             AppUIConfigService.to.radius[Size.M],
//           ),
//         ),
//         padding: EdgeInsets.symmetric(
//           vertical: AppUIConfigService.to.margins[Size.S],
//         ),
//       ),
//       child: Text(
//         text,
//         style: Get.theme.accentTextTheme.bodyLarge
//             .copyWith(color: Get.theme.accentTextTheme.bodyText1.color),
//       ),
//     );
//   }
// }
