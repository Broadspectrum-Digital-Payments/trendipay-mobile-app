import 'package:bdp_payment_app/common/constants/general_repository.dart';
import 'package:bdp_payment_app/common/models/transaction_history.dart';
import 'package:bdp_payment_app/common/widgets/common_widgets.dart';
import 'package:bdp_payment_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/colors.dart';

Widget reusableHistoryData(
    {TransactionHistory? history, bool loading = false}) {
  return SizedBox(
      height: 0.7.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Container(
          padding: EdgeInsets.all(16.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: BDPColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: Text(
            'Transaction Details',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: BDPColors.white,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 18.w),
            child: loading
                ? Center(
                    child: loader(loaderColor: BDPColors.secondColor),
                  )
                : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _reusableTransactionItem("Date of transaction",
                            "${GeneralRepository.fullDate(history?.processDate ?? DateTime.now())},${GeneralRepository.time(history?.processDate ?? DateTime.now())}"),
                        BDPSizes.verticalSpacer(space: 12.h),
                        _reusableTransactionItem(
                            "Amount", history?.formattedAmount ?? ""),
                        BDPSizes.verticalSpacer(space: 12.h),
                        _reusableTransactionItem(
                            "Receiver", history?.member?.name ?? ""),
                        BDPSizes.verticalSpacer(space: 12.h),
                        _reusableTransactionItem(
                            "Account number", history?.member?.username ?? ""),
                        BDPSizes.verticalSpacer(space: 12.h),
                        _reusableTransactionItem(
                            "Phone number", history?.member?.mobileNumber ?? ""),
                        BDPSizes.verticalSpacer(space: 12.h),
                        _reusableTransactionItem(
                            "Transaction type", history?.transferType?.name ?? ""),
                        BDPSizes.verticalSpacer(space: 12.h),
                        _reusableTransactionItem(
                            "Note", history?.description ?? ""),
                        BDPSizes.verticalSpacer(space: 12.h),
                        _reusableTransactionItem("Status", history?.status ?? "",
                            success: history?.status == "PROCESSED"),
                      ],
                    ),
                ),
          ),
        )
      ]));
}

_reusableTransactionItem(String title, String data, {bool? success = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 16.sp,
            color: BDPColors.grey,
            fontWeight: FontWeight.w400),
      ),
      BDPSizes.verticalSpacer(space: 12.h),
      Text(
        data,
        style: TextStyle(
            fontSize: 18.sp,
            color: success! ? BDPColors.secondColor : BDPColors.grey,
            fontWeight: FontWeight.w700),
      )
    ],
  );
}

Widget buildDivider() {
  return Divider(
    color: Colors.grey[300],
    thickness: 1,
    height: 0,
  );
}
