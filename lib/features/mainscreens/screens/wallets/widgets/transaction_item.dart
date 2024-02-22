import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String time;
  final String amount;
  final bool isSuccess;

  const TransactionItem({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.amount,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First column: Image
        Image.asset(BDPImages.momoTransfer),
        const SizedBox(
          width: 10,
        ),
        // Second column: Title, description, date, and time
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black)),
              Text(description, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: BDPColors.grey),),
              Text('$date $time', style:const TextStyle(fontWeight: FontWeight.w700,fontSize: 10,color: Colors.black),),
            ],
          ),
        ),
        // Third column: Amount and status
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(amount, style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 14, color: Colors.black)),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
            Text(isSuccess ? 'Success' : 'Failed', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: isSuccess ? const Color(0xff30a806) : BDPColors.secondary),),
          ],
        ),
      ],
    );
  }
}
