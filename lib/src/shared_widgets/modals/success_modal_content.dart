// import 'package:aider_mobile_app/core/extensions/widgets/text_extension.dart';
// import 'package:aider_mobile_app/core/utils/app_theme_util.dart';
// import 'package:aider_mobile_app/core/constants/colors.dart';
// import 'package:aider_mobile_app/src/shared_widgets/common/v_space.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../../../core/routing/app_navigator.dart';
// import '../../../../../base/popup_modal_body.dart';
// import '../../../../../buttons/app_primary_button.dart';
// import '../../../../../common/app_lottie.dart';
//
// class SuccessModalContent extends StatelessWidget {
//   const SuccessModalContent({
//     super.key,
//     this.title = '',
//     required this.message,
//     this.onButtonPressed,
//     this.verticalPadding,
//     this.buttonText,
//   });
//
//   final String title;
//   final String message;
//   final void Function()? onButtonPressed;
//   final double? verticalPadding;
//   final String? buttonText;
//
//   @override
//   Widget build(BuildContext context) {
//     return PopupModalBody(
//       verticalPadding: verticalPadding?? 16.0,
//       title: Column(
//         children: [
//           const VSpace(height: 32.0),
//           AppLottie(
//             filePath: 'check.json',
//             repeat: false,
//             width: AppThemeUtil.radius(120.0),
//             height: AppThemeUtil.radius(120.0),
//           ),
//           if(title.isNotEmpty) ...[
//             const VSpace(height: 16.0),
//             Text(
//               title,
//             ).extraBold().fontSize(20.0).color(kPrimaryBlack).alignText(TextAlign.center),
//           ]
//         ],
//       ),
//       actions: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AppPrimaryButton(
//               onPressed: onButtonPressed?? (){
//                 AppNavigator.pop(context);
//               },
//               text: buttonText?? 'Okay',
//             ),
//           ],
//         )
//       ],
//       child: message.isEmpty? const SizedBox.shrink() : Text(message).regular().fontSize(16.0).color(kPrimaryBlack).alignText(TextAlign.center),
//     );
//   }
// }
