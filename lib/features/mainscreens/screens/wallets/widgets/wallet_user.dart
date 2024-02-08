import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';

class WalletUser extends StatelessWidget {
  const WalletUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(BDPImages.user),
          const Text(BDPTexts.walletAppbarTitle,style: TextStyle(color: BDPColors.grey, fontWeight: FontWeight.w400, fontSize: 12),),
          const Text(BDPTexts.walletAppbarSubTitle,style: TextStyle(color: BDPColors.primary, fontWeight: FontWeight.w700, fontSize: 12),),
          const Icon(Icons.notifications_none, color: BDPColors.grey,),
        ],
      ),
    );
  }
}