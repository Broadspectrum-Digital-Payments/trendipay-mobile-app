import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';



class BankTransferInfo extends StatelessWidget {
  const BankTransferInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 82,
      decoration: BoxDecoration(
        border: Border.all(// Color of the border
          width: 1, // Width of the border
        ),
        borderRadius: BorderRadius.circular(12),
        color: BDPColors.containerColor,
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.sim_card_alert),
            SizedBox(
              width: 2,
            ),
            Expanded(child: Text(BDPTexts.bankTransferInfo)),
          ],
        ),
      ),
    );
  }
}
