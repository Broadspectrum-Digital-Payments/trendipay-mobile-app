import 'package:flutter/material.dart';
import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';


class SendUsAnEmail extends StatelessWidget {
  const SendUsAnEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(BDPImages.emailUs),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              BDPTexts.emailUs,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              BDPTexts.ourEmail,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
