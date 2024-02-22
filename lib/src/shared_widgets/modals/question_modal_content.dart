//
// import 'package:flutter/material.dart';
// import '../../../../../../../core/routing/app_navigator.dart';
// import '../../../core/utils/app_theme_util.dart';
//
// class QuestionModalContent extends StatelessWidget {
//   const QuestionModalContent({
//     super.key,
//     this.title = '',
//     required this.questionText,
//     required this.onYesPressed,
//     this.onNoPressed,
//     this.hasDangerIcon = false,
//     this.reverseYesNo = false,
//     this.color,
//     this.borderColor,
//     this.icon,
//   });
//
//   final String title;
//   final String questionText;
//   final void Function() onYesPressed;
//   final void Function()? onNoPressed;
//   final bool hasDangerIcon;
//   final bool reverseYesNo;
//   final Color? color;
//   final Color? borderColor;
//   final Widget? icon;
//
//   @override
//   Widget build(BuildContext context) {
//     return PopupModalBody(
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           if(hasDangerIcon) ...[
//             const VSpace(height: 32.0),
//             Container(
//               width: AppThemeUtil.radius(192.0),
//               height: AppThemeUtil.radius(117.0),
//               decoration: BoxDecoration(
//                   // color: kError600,
//                   borderRadius: BorderRadius.circular(AppThemeUtil.radius(12.0))
//               ),
//               padding: EdgeInsets.all(AppThemeUtil.radius(7.0)),
//               child: icon ?? ZSvgIcon(
//                 'notification_alrt.svg',
//                 size: AppThemeUtil.radius(24.0),
//                 color: AppThemeUtil.getThemeColor(kGrey300),
//               ),
//             ),
//           ],
//           Text(
//             title,
//           ).extraBold().fontSize(20.0).color(kPrimaryBlack).alignText(TextAlign.center).paddingOnly(top: 32.0),
//         ],
//       ),
//       actions: [
//         ActionButtons(
//           onYesPressed: onYesPressed,
//           onNoPressed: onNoPressed,
//           reverseYesNo: reverseYesNo,
//           color: color,
//           borderColor: borderColor,
//         )
//       ],
//       child: Text(questionText).regular().fontSize(16.0).color(kPrimaryBlack).alignText(TextAlign.center),
//     );
//   }
// }
//
//
// class ActionButtons extends StatelessWidget {
//   const ActionButtons({
//     super.key,
//     required this.onYesPressed,
//     this.onNoPressed,
//     required this.reverseYesNo,
//     this.color,
//     this.borderColor,
//   });
//
//
//   final void Function() onYesPressed;
//   final void Function()? onNoPressed;
//   final bool reverseYesNo;
//   final Color? color;
//   final Color? borderColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return reverseYesNo? Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         AppPrimaryButton(
//           onPressed: onYesPressed,
//           text: 'Yes',
//           color: color??kPrimaryBlack,
//           borderColor: borderColor?? kPrimaryBlack,
//         ).flexible(),
//         const HSpace(width: 16.0),
//         AppPrimaryButton(
//           onPressed: onNoPressed?? (){
//             AppNavigator.pop(context);
//           },
//           text: 'No',
//           color: kPrimaryWhite,
//           textColor: kPrimaryBlack,
//         ).flexible(),
//       ],
//     ) : Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         AppPrimaryButton(
//           onPressed: onNoPressed?? (){
//             AppNavigator.pop(context);
//           },
//           text: 'No',
//           color: kPrimaryWhite,
//           textColor: kPrimaryBlack,
//         ).flexible(),
//         const HSpace(width: 16.0),
//         AppPrimaryButton(
//           onPressed: onYesPressed,
//           text: 'Yes',
//         ).flexible(),
//       ],
//     );
//   }
// }
//
