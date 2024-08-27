
import 'package:bdp_payment_app/core/utils/app_theme_util.dart';
import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  const FormLabel(this.label, {
    super.key,
  });

  final String label;


  @override
  Widget build(BuildContext context) {
   return Text(
     label,
     style: TextStyle(
       fontSize: AppThemeUtil.fontSize(16.0),
       fontWeight: FontWeight.w400,
     ),
   );
  }
}
