import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';

class WalletUser extends StatelessWidget {
  // final NavigationMenuController? controller;
  const WalletUser({
    super.key,
    // this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(BDPImages.user),
          Text(BDPTexts.walletAppbarTitle,style: TextStyle(color: BDPColors.grey, fontWeight: FontWeight.w400, fontSize: 12.sp),),
          // Text(controller!.name,style: TextStyle(color: BDPColors.primary, fontWeight: FontWeight.w700, fontSize: 12.sp),),
          const Icon(Icons.notifications_none, color: BDPColors.grey,),
        ],
      ),
    );
  }
}