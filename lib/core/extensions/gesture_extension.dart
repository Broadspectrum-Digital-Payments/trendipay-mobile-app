import 'package:flutter/material.dart';


extension GestureExtension on Widget {

  TextButton onPressed(void Function() function) => TextButton(
    onPressed: function,
    style: TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      splashFactory: NoSplash.splashFactory,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    child: this,
  );

  Widget iconPressed(void Function()? function, {EdgeInsetsGeometry? padding, AlignmentGeometry? alignment}) => IconButton(
    padding: padding?? EdgeInsets.zero,
    alignment: alignment?? Alignment.center,
    onPressed: function,
    icon: this,
  );



  Theme onLongPress(void Function() function) => Theme(
    data: ThemeData(
      splashColor: Colors.transparent,
    ),
    child: TextButton(
      onPressed: null,
      onLongPress: function,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        splashFactory: NoSplash.splashFactory,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: this,
    ),
  );

}