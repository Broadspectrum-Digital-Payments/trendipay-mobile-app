import 'package:bdp_payment_app/features/mainscreens/screens/notification/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../common/widgets/custom_appbar/custom_appbar.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(appBarTitle: BDPTexts.notifications,),
      body:   SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BDPSizes.defaultSpace),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      NotificationItem(title: BDPTexts.routineNotice, description: BDPTexts.routineNoticeTexts, date: BDPTexts.date1 , time: BDPTexts.time1),
                      SizedBox(height: BDPSizes.spaceBtwItems,),
                      NotificationItem(title: BDPTexts.tipsInspiration, description: BDPTexts.tipsInspirationTexts, date: BDPTexts.date2 , time: BDPTexts.time2),
                      SizedBox(height: BDPSizes.spaceBtwItems,),
                      NotificationItem(title: BDPTexts.promotion, description: BDPTexts.promotionTexts, date: BDPTexts.date3 , time: BDPTexts.time3),
                      SizedBox(height: BDPSizes.spaceBtwItems,),
                      NotificationItem(title: BDPTexts.communityEngagement, description: BDPTexts.communityEngagementTexts, date: BDPTexts.date4 , time: BDPTexts.time4),
                      SizedBox(height: BDPSizes.spaceBtwItems,),
                      NotificationItem(title: BDPTexts.specialOfferAlert, description: BDPTexts.specialOfferAlertTexts, date: BDPTexts.date5 , time: BDPTexts.time5),
                      SizedBox(height: BDPSizes.spaceBtwItems,),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

