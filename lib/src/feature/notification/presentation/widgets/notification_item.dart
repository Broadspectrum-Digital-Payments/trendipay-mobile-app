import 'package:bdp_payment_app/src/feature/notification/presentation/widgets/circular_shape.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_strings.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String time;

  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
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
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black)),
              const SizedBox(height: 3,),
              Text(description, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: BDPColors.grey),),
              const SizedBox(height: 4,),
              Text(date, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: BDPColors.grey),),
            ],
          ),
        ),
        // Third column: Amount and status
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(time, style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14, color: Colors.black)),
              ],
            ),
           const SizedBox(
             height: 20,
           ),
           const CircularNavigator(width: 10, height: 10, backgroundColor: BDPColors.notification)
          ],
        ),
      ],
    );
  }
}
