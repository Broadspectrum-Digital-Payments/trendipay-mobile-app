
import 'package:bdp_payment_app/core/constants/colors.dart';
import 'package:bdp_payment_app/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

List<String> networks = ["MTN Momo", "Vodafone Cash", "AT Money"];

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


Widget getNetworkTypeWidget(Function(String?)? onChanged) {
  return DropdownButtonFormField<String>(
    hint: Text(
      BDPTexts.mobileNetwork,
      style: TextStyle(
          color: Colors.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal),
    ),
    iconSize: 14.sp,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,

      ),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.72,
            color: Colors.grey,
          )),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.72,
            color: BDPColors.primary,
          )),
    ),
    onChanged: onChanged,
    items: networks.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
        ),
      );
    }).toList(),
  );
}