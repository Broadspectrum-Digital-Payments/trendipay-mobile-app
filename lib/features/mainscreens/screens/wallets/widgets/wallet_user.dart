import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:bdp_payment_app/core/view_models/base_view.dart';
import 'package:bdp_payment_app/core/view_models/user_view_model.dart';
import 'package:bdp_payment_app/src/shared_widgets/common/h_space.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';

class WalletUser extends StatelessWidget {
  const WalletUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: BaseView<UserViewModel>(
        builder: (context, userConsumer, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(BDPImages.user),
              Text(BDPTexts.walletAppbarTitle,style: TextStyle(color: BDPColors.grey, fontWeight: FontWeight.w400, fontSize: AppThemeUtil.fontSize(12)),),
              Text(userConsumer.getUser.greetingName,style: TextStyle(color: BDPColors.primary, fontWeight: FontWeight.w700, fontSize: AppThemeUtil.fontSize(12)),),
              const HSpace(width: 8.0),
              const Icon(Icons.notifications_none, color: BDPColors.grey,),
            ],
          );
        }
      ),
    );
  }
}