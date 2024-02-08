import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/button/button.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../chat_screen/chat_screen.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 163,
        height: 50,
        child: Buttons(
          buttonName: BDPTexts.chat,
          image: BDPImages.rightArrow,
          onPressed: () {
            Get.to(ChatScreen());
          },
        ));
  }
}