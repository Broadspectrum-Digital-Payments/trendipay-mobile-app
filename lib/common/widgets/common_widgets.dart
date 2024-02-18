
import 'package:bdp_payment_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

Widget loader({double? value, Color? loaderColor}) {
  return SizedBox(
    height: 15.w,
    width: 15.w,
    child: CircularProgressIndicator(
      strokeWidth: 1.5,
      color: loaderColor ?? BDPColors.white,
      value: value,
    ),
  );
}


formatTime(date){
  String formattedDate = DateFormat('h:mm a').format(date);
  return formattedDate;
}