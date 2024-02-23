import 'package:flutter/material.dart';

class CircularNavigator extends StatelessWidget {
  const CircularNavigator({
    super.key, required this.width, required this.height, required this.backgroundColor,
  });
  final double width;
  final double height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: backgroundColor,
      ),
    );
  }
}