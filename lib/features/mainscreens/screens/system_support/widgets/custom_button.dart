import 'package:flutter/material.dart';

import '../../../../../common/widgets/button/button.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
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

          },
        ));
  }
}