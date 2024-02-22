import 'dart:ui';

import 'package:bdp_payment_app/core/constants/image_strings.dart';
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/app_lottie.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'helper_util.dart';

enum DialogAction { yes, abort }

class AppDialogUtil {
  static Future<void> loadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        barrierColor: AppThemeUtil.getThemeColor(BDPColors.kBlack70),
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: PopScope(
              canPop: false,
              child: SimpleDialog(
                elevation: 0.0,
                contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                titlePadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                backgroundColor: Colors.transparent,
                children: <Widget>[
                  AppLottie(
                    filePath: BDPImages.loading,
                    height: AppThemeUtil.radius(120.0),
                    width: AppThemeUtil.radius(120.0),
                    repeat: true,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          );
        },
    );
  }


  static Future showScrollableBottomSheet( {
    required BuildContext context,
    bool? isDismissible,
    bool useSafeArea = true,
    required Widget Function(BuildContext) builder
  })
  {
    return showModalBottomSheet(
      context: context,
      elevation: 0,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      useSafeArea: HelperUtil.isIOS? false : useSafeArea,
      isDismissible: isDismissible?? true,
      barrierColor: AppThemeUtil.getThemeColor(BDPColors.kBlack70),
      builder: builder,
    );
  }

  static Future<dynamic> popUpModal(BuildContext context,{
    bool willPop = true,
    bool barrierDismissible = false,
    required Widget modalContent,
  }) async {
    await showDialog(
      barrierDismissible: barrierDismissible,
      barrierColor: AppThemeUtil.getThemeColor(BDPColors.kBlack70),
      context: context,
      builder: (BuildContext context) {
        return  PopScope(
          canPop: willPop,
          child: modalContent,
        );
      },
    );
  }



}
